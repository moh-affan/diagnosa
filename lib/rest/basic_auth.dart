import 'dart:convert';

import 'package:http/http.dart' as http;

class BasicAuth {
  String _username;
  String _password;
  String _url;
  Map<String, String> _authHeader;

  BasicAuth(this._username, this._password) {
    _authHeader = {'authorization': _genAuth()};
  }

  _genAuth() => 'Basic ' + base64Encode(utf8.encode('$_username:$_password'));

  void withApiKey(String apiKey) {
    _authHeader.addAll({'x-api-key': apiKey});
  }

  void setBaseUrl(String baseUrl) {
    _url = baseUrl;
  }

  Future<http.Response> get(String url, {Map<String, String> headers}) {
    headers.addAll(_authHeader);
    if (_url != null) url = _url + url;
    return http.get(url, headers: headers);
  }

  Future<http.Response> post(String url, {Map<String, String> headers, body,  Encoding encoding}) {
    headers.addAll(_authHeader);
    if (_url != null) url = _url + url;
    return http.post(url, headers: headers, body: body,  encoding: encoding);
  }
}
