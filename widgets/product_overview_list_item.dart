import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/provider/cart_item_provider.dart';
import 'package:shop_app/screens/product_details_screen.dart';

class ProductOverviewListItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final bool isFavorite;

  // ProductOverviewListItem({
  //   // @required this.id,
  //   // @required this.title,
  //   // @required this.imageUrl,
  //   // @required this.isFavorite,
  // });

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartItemProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        16.0,
      ),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: productModel.id,
            );
          },
          child: Image.network(
            '${productModel.imageUrl}',
            fit: BoxFit.cover,
          ),
        ),
        footer: Container(
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  productModel.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => productModel.toggleFavorite(),
              ),
              Expanded(
                child: Text(
                  productModel.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => cartProvider.addItem(
                  productModel.id,
                  productModel.title,
                  productModel.price,
                  1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
