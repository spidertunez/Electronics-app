import 'package:dio/dio.dart';
import '../models/productmodel.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response =
          await dio.get('https://student.valuxapps.com/api/products');

      final List<dynamic> products = response.data['data']['data'];

      return products
          .map((product) => ProductModel.fromJson(product))
          .toList()
          .cast<ProductModel>();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
