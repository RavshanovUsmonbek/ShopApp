import 'package:flutter/material.dart';
import 'package:new_app/providers/product.dart';
import 'package:new_app/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';


  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; // is the id!
    final ProductProvider product = Provider.of<ProductsProvider>(context).findById(productId);  
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
