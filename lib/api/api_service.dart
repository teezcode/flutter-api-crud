import 'dart:convert';

import 'package:api_crud/datamodels/get_product_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Product>> getProducts() async {
    var response =
        await http.get(Uri.parse('http://97.74.6.243/LiteHR/api/AssetTypes'));
    // dynamic decodedResponse = json.decode(response.body);
    List<Product> products = getProductListFromMap(response.body);
    return products;
  }

  static deleteProduct(int id) async {
    Map data = {
      'id': id.toString(),
    };
    var response = await http.delete(
      Uri.parse('http://97.74.6.243/LiteHR/api/AssetTypes/$id'),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    // dynamic decodedResponse = json.decode(response.body);
    print(response.body);
  }

  static addProduct({String name, bool active}) async {
    Map<String, dynamic> data = {'name': name, 'active': active};
    var response = await http.post(
      Uri.parse('http://97.74.6.243/LiteHR/api/AssetTypes'),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    // dynamic decodedResponse = json.decode(response.body);
    print(response.body);
  }

  static editProduct({String name, bool active, String id}) async {
    Map<String, dynamic> data = {'name': name, 'active': active,'id':id};
    var response = await http.put(
      Uri.parse('http://97.74.6.243/LiteHR/api/AssetTypes/$id'),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    // dynamic decodedResponse = json.decode(response.body);
    print(response.body);
  }

}
