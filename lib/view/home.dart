import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/ProductProvider.dart';
import '../view/productCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.errorMessage != null) {
            return Center(child: Text('Error: ${provider.errorMessage}'));
          } else if (provider.products.isNotEmpty) {
            return ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                return ProductCard(productModel: provider.products[index]);
              },
            );
          } else {
            return const Center(child: Text('No Products Available'));
          }
        },
      ),
    );
  }
}
