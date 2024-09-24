import 'package:electronics_app/view/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(ProductApp());
}

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
