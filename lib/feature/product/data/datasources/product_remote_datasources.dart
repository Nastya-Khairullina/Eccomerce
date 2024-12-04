import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProduct();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProduct() => _getProductFromUrl(current_productURL );

  Future<List<ProductModel>> _getProductFromUrl(String url) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      debugPrint ('@@@@@@@response@@@@@@ $response');
      final List<dynamic> jsonList = json.decode(response.body);
      debugPrint ('@@@@@@@response.body@@@@@@ ${response.body}');
      List<ProductModel> list = jsonList.map((json)=> ProductModel.fromJson(json)).toList();
      debugPrint (response.body);
      return list;
    } else {
      throw ServerException();
    }
  }
}