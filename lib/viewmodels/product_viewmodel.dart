import 'package:api_crud/api/api_service.dart';
import 'package:api_crud/datamodels/get_product_response.dart';
import 'package:flutter/material.dart';

class ProductViewmodel extends ChangeNotifier{

  addProduct({String name, bool val})async{
      await ApiService.addProduct(name: name, active: val);
  }

  editProduct({String name, bool val , String id}) async{
      await ApiService.editProduct(name: name, active: val, id: id);
  }

  deleteProduct(int id) async{
    await ApiService.deleteProduct(id);

    notifyListeners();
  }

  refreshScreen(){
    notifyListeners();
  }

  Future<List<Product>> getProducts() async{
    try{
      List<Product> products = await ApiService.getProducts();
      print(products);

      return products;
    } catch(e){
      print("An error occured : " + e.toString());
    }

  }
}