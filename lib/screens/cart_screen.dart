import 'package:flutter/material.dart';
import 'package:new_app/providers/cart.dart' show Cart;
import 'package:new_app/providers/orders.dart';
import 'package:new_app/widgets/CartItem.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    var cart  = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total cost"),
                  Spacer(),
                  Chip(
                    label:Text(
                        '\$${cart.totalCost}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: (){
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalCost,
                      );
                      cart.clearCart();
                    }, 
                    child: Text(
                      "ORDER NOW",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height:10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i){
                var cartList = cart.items.values.toList();
                return CartItem(
                  id: cartList[i].id,
                  productId: cart.items.keys.toList()[i],
                  title: cartList[i].title, 
                  quantity: cartList[i].quantity, 
                  price: cartList[i].price,
                );
              },
              itemCount: cart.items.length,
            ) 
          ),
        ],
      ),
    );
  }
}