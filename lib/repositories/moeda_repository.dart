import 'package:cripto_moedas/models/moeda.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class MoedaRepository {
  static Future<List<Moeda>> getListofCoins() async {
    late Dio rest = new Dio(BaseOptions(
        receiveTimeout: 60000,
        connectTimeout: 60000,
        contentType: 'application/json',
        responseType: ResponseType.json,
        followRedirects: false));

    try {
      Response result = await rest.get("https://628bf56c667aea3a3e38bc3d.mockapi.io/api/v1/coins");

      //var coins = Moeda.fromJson(result.data);

      var coins = (result.data as List).map((e) {
        return Moeda.fromJson(e);
      }).toList();

      return coins;

    } on Exception catch (error, stacktrace) {
      print(error);
      rethrow;
    }
  }
}
