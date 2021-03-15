import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/ProductItem.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {  
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products = showFavs ? productData.favoriteProducts : productData.products;
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
      ), 
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}