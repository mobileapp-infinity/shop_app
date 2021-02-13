import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_overview_provider.dart';
import 'package:shop_app/utils/constant.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final productProvider = Provider.of<ProductOverViewProvider>(
      context,
      listen: false,
    ).findProdcutModelById(productId);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          productProvider.title,
          style: TextStyle(
            fontSize: ConstantsVar.FONT_SIZE_18,
            color: Colors.white,
            fontFamily: ConstantsVar.FONT_FAMILY_UBUNTU_REGULAR,
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 400,
              child: Image.network(
                productProvider.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '\$${productProvider.price.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: ConstantsVar.FONT_SIZE_20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productProvider.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: ConstantsVar.FONT_SIZE_18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
