import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../model/response/ProductResponseDto.dart';
import 'api_constants.dart';
import 'base_error.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }


  Future<Either<BaseError, ProductResponseDto>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)  ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.parse('https://dummyjson.com/products');
      var response = await http.get(url);
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(BaseError(errMsg: 'Error ${response.statusCode}'));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }


}
