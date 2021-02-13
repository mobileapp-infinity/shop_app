import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_item_provider.dart';
import 'package:shop_app/utils/constant.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartItemProvider>(
      context,
      listen: false,
    );
    final double totalAmount = cartItemProvider.getTotalAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(
            fontSize: ConstantsVar.FONT_SIZE_16,
            color: Colors.white,
            fontFamily: ConstantsVar.FONT_FAMILY_UBUNTU_REGULAR,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 6.0,
            color: Colors.purple[50],
            margin: EdgeInsets.all(
              16.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontFamily: ConstantsVar.FONT_FAMILY_UBUNTU_MEDIUM,
                      fontSize: ConstantsVar.FONT_SIZE_18,
                      color: Colors.purple,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: ConstantsVar.FONT_SIZE_16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: ConstantsVar.FONT_SIZE_18,
                        fontFamily: ConstantsVar.FONT_FAMILY_UBUNTU_MEDIUM,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Row(
//               children: [

//               ],
//             )

// Card(
//         margin: EdgeInsets.all(
//           16.0,
//         ),
//         elevation: 6.0,
//         child: ListTile(
//           title: Container(
//             color: Colors.black38,
//             child: Text(
//               'Total',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: ConstantsVar.FONT_SIZE_20,
//               ),
//             ),
//           ),
//           trailing: Container(
//             child: Container(
//               width: 200,
//               color: Colors.black54,
//               child: Row(
//                 children: [
//                   Chip(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     label: Text(
//                       '\$${totalAmount.toStringAsFixed(2)}',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: ConstantsVar.FONT_SIZE_16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       )
