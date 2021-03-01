import 'package:flutter/material.dart';
import 'package:new_app/screens/product_detail_screen.dart';


class ProductItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;

  ProductItem({
    @required this.imageUrl, 
    @required this.id, 
    @required this.title
  });
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments:id, 
            );
          },
          child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(title,
              textAlign: TextAlign.center,
               style: TextStyle(color: Colors.white),),
            leading: IconButton(
              icon: Icon(Icons.favorite, color: Theme.of(context).accentColor),
              onPressed: (){},
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
              onPressed: (){},
            ),
          ),    
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}