import 'package:http/http.dart';

import '../../shared/request_exception.dart';


abstract class ClientHttpsBase {
  final Client _http;
  ClientHttpsBase(this._http);

  Future<Response> get<T>(
    String path,
  ) async {
    try {
      return await _http.get(
        Uri.parse(path),
      );
    } on ClientException catch (e) {
      throw RequestException(message: e.message);
    }
  }
}
