import 'package:dio/dio.dart';
import 'package:electronics_app/MOdels/productmodel.dart';
import 'package:electronics_app/services/productservice.dart';
import 'package:electronics_app/view/productCard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<ProductModel>> productFuture;

  @override
  void initState() {
    super.initState();
    ProductService productService = ProductService(Dio());
    productFuture = productService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            if (products.isNotEmpty) {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(productModel: products[index]);
                },
              );
            } else {
              return const Center(
                child: Text('No Products Available'),
              );
            }
          } else {
            return const Center(
              child: Text('No Data Available'),
            );
          }
        },
      ),
    );
  }
}
