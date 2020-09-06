part of api_hacks;

const TOKEN_ENDPOINT =
    "https://open.spotify.com/get_access_token?reason=transport&productType=web_player";

class TokenCollector extends oauth2.Client {
  static Future<Map<String, dynamic>> requestForCredentials() async =>
      jsonDecode((await http.get(TOKEN_ENDPOINT)).body);

  TokenCollector() : super(oauth2.Credentials(""));

  http.Client _httpClient = http.Client();
  oauth2.Credentials _credentials;

  oauth2.Credentials get credentials => _credentials;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (credentials == null || credentials.isExpired) {
      if (credentials != null && !credentials.canRefresh)
        throw oauth2.ExpirationException(credentials);
      await refreshCredentials();
    }

    request.headers['authorization'] = 'Bearer ${credentials?.accessToken}';
    var response = await _httpClient.send(request);

    return response;
  }

  @override
  Future<oauth2.Client> refreshCredentials([List<String> newScopes]) async {
    var data = await TokenCollector.requestForCredentials();

    var accessTokenExpirationTimestampMs =
        data['accessTokenExpirationTimestampMs'] ?? 0;
    var accessToken = '';

    if (data['accessToken'] != null) {
      accessToken = data['accessToken'];
    } else {
      throw Exception('Unable to get message');
    }

    _credentials = oauth2.Credentials(
      accessToken,
      expiration:
          DateTime.fromMicrosecondsSinceEpoch(accessTokenExpirationTimestampMs),
    );

    return this;
  }
}
