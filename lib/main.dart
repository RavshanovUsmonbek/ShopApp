import 'package:flutter/material.dart';
import 'package:new_app/providers/cart.dart';
import 'package:new_app/providers/orders.dart';
import 'package:new_app/providers/products.dart';
import 'package:new_app/screens/cart_screen.dart';
import 'package:new_app/screens/orders_screen.dart';
import 'package:provider/provider.dart';

import 'screens/product_detail_screen.dart';
import 'screens/products_overview_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],

      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
          }
      ),
    ); 
  }
}