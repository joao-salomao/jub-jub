import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

class AuthHttpClient extends IOClient {
  Map<String, String> _headers;

  AuthHttpClient(this._headers) : super();

  @override
  send(http.BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<http.Response> head(Object url, {Map<String, String> headers}) =>
      super.head(url, headers: headers..addAll(_headers));
}
