import 'package:flutter/material.dart';
import 'package:new_app/providers/orders.dart' hide OrderItem;
import 'package:new_app/widgets/AppDrawer.dart';
import '../widgets/OrderItem.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title:Text("Orders screen")),
      body: ListView.builder(itemBuilder: (ctx, index){
        return OrderItem(orderData.orders[index]);
      },
      itemCount: orderData.orders.length,),
      drawer: AppDrawer(), 
    );
  }
}