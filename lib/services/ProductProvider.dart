import 'package:flutter/material.dart';
import '../models/productmodel.dart';
import '../services/ProductService.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService productService;
  List<ProductModel> products = [];
  String? errorMessage;
  bool isLoading = false;

  ProductProvider(this.productService) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedProducts = await productService.getProducts();
      products = List<ProductModel>.from(fetchedProducts);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to fetch products';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
