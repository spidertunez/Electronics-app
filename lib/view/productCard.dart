import 'package:flutter/material.dart';
import '../models/productmodel.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 380,
              width: double.infinity,
              child: Image.network(
                productModel.image.isNotEmpty ? productModel.image : '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    alignment: Alignment.center,
                    child: const Text('Image not available'),
                  );
                },
              ),
            ),
          ),
          Text(
            productModel.description.isNotEmpty ? productModel.description : 'No description available',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
          Text(
            '\$${productModel.price}',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
