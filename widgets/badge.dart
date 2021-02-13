import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_item_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/utils/constant.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed(
              CartScreen.routeName,
            );
          },
        ),
        Positioned(
          top: 8,
          right: 6,
          child: Container(
            height: 16,
            width: 16,
            alignment: Alignment.center,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).accentColor,
            ),
            child: Consumer<CartItemProvider>(
              builder: (ctx, cartItemProvider, child) => FittedBox(
                child: Text(
                  cartItemProvider.items.length.toStringAsFixed(0),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: ConstantsVar.FONT_SIZE_11),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
