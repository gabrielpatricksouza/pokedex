import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import '../core/client_https_base.dart';

final $ClientHttps = Bind.singleton(
  (i) => ClientHttps(),
);

class ClientHttps extends ClientHttpsBase {
  final HttpClient _client;
  ClientHttps() : _client = HttpClient(), super(Client());
  HttpClient get client => _client;
}
