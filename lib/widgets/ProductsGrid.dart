import 'package:flutter/material.dart';
import 'package:new_app/models/product.dart';
import 'package:provider/provider.dart';

import '../widgets/ProductItem.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products = productData.products;
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
      ), 
      itemBuilder: (ctx, index) => ProductItem(
        title: products[index].title,
        id: products[index].id,
        imageUrl: products[index].imageUrl,
      ),
      itemCount: products.length,
    );
  }
}