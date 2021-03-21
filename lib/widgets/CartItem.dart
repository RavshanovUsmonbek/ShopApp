import 'package:flutter/material.dart';
import 'package:new_app/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });


  @override
  Widget build(BuildContext context) {
    return Dismissible(
          key: ValueKey(id),
          background: Container(
            margin: EdgeInsets.symmetric(vertical:4, horizontal: 15),
            color: Theme.of(context).errorColor,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction){
            Provider.of<Cart>(context, listen: false).removeItem(productId);
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical:4, horizontal: 15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(child: Text('\$$price')),
                  ),
                ),
                title: Text(title),
                subtitle: Text('Total: \$${price * quantity}'),
                trailing: Text('${quantity}x'),
              ),
            ),
          ),
      );
  }
}