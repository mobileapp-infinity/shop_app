import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_overview_provider.dart';
import 'package:shop_app/utils/constant.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/product_overview_list_item.dart';

enum ShowFavoritesAndAllEnum {
  showFavorites,
  showAll,
}

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductOverViewProvider>(context);

    final productList = _isFavorite
        ? productProvider.showFavorites
        : productProvider.getProductItemList;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop App',
          style: TextStyle(
            fontFamily: ConstantsVar.FONT_FAMILY_UBUNTU_REGULAR,
            fontSize: ConstantsVar.FONT_SIZE_18,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (selectedItem) {
              setState(() {
                if (selectedItem == ShowFavoritesAndAllEnum.showFavorites) {
                  //show favorites selected
                  _isFavorite = true;
                } else if (selectedItem == ShowFavoritesAndAllEnum.showAll) {
                  //show all selected
                  _isFavorite = false;
                }
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: ShowFavoritesAndAllEnum.showFavorites,
                child: Text(
                  'Show Favorites',
                ),
              ),
              PopupMenuItem(
                value: ShowFavoritesAndAllEnum.showAll,
                child: Text(
                  'Show All',
                ),
              ),
            ],
          ),
          Badge(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider.value(
              value: productList[index],
              child: ProductOverviewListItem(
                  // id: productProvider.getProductItemList[index].id,
                  // title: productProvider.getProductItemList[index].title,
                  // imageUrl: productProvider.getProductItemList[index].imageUrl,
                  // isFavorite:
                  //     productProvider.getProductItemList[index].isFavorite,
                  ),
            );
          },
          itemCount: productList.length,
        ),
      ),
    );
  }
}
