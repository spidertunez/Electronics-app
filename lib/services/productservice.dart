import 'package:dio/dio.dart';
import '../MOdels/productmodel.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await dio.get('https://student.valuxapps.com/api/products');
      List<dynamic> products = response.data;

      List<ProductModel> productList = [];
      for (var product in products) {
        ProductModel productModel = ProductModel.fromJson(product);
        productList.add(productModel);
      }
      return productList;
    } catch (e) {
      print('Error in fetchProducts: $e');
      return [];
    }
  }
}
