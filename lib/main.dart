import 'package:dio/dio.dart';
import 'package:electronics_app/services/ProductProvider.dart';
import 'package:electronics_app/services/ProductService.dart';
import 'package:electronics_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ProductService(Dio())),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(Provider.of<ProductService>(context, listen: false)),
        ),
      ],
      child: const ProductApp(),
    ),
  );
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
