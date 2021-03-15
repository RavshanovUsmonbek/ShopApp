import 'package:flutter/material.dart';
import 'package:new_app/providers/cart.dart';
import 'package:new_app/providers/product.dart';
import 'package:new_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';


class ProductItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    final cart = Provider.of<Cart>(context, listen: true);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments:product.id, 
            );
          },
          child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
               style: TextStyle(color: Colors.white),),
            leading: IconButton(
              icon: Icon(product.isFavorite? Icons.favorite: Icons.favorite_border, color: Theme.of(context).accentColor),
              onPressed: (){product.toggleFavoriteness();},
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
              onPressed: (){
                return cart.addItem(product.id, product.price, product.title);
              },
            ),
          ),    
          child: Image.network(product.imageUrl, fit: BoxFit.cover,),
        ),
      ),
    );
  }
}