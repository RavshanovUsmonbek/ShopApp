import 'package:flutter/material.dart';
import '../widgets/ProductsGrid.dart';

class ProductsOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products Overview")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ProductsGrid(),
      )
    );
  }
}