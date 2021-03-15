import 'package:flutter/material.dart';
import 'package:new_app/providers/cart.dart';
import 'package:new_app/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../widgets/ProductsGrid.dart';

class ProductsOverviewScreen extends StatefulWidget {

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {  
  bool _showFavs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Overview"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int selectedValue){
              setState((){
                if(selectedValue==0){
                  this._showFavs=true;
                }
                else{
                  this._showFavs=false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorites'), value: 0),
              PopupMenuItem(child: Text('Show All'), value: 1),
            ]
          ),
          Consumer<Cart>(
            builder:(ctx, cart, ch)=> Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ProductsGrid(_showFavs),
      )
    );
  }
}