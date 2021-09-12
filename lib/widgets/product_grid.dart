import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  //final List<Product> loadedProducts = [];
  final bool showOnlyFavorite;

  ProductGrid(this.showOnlyFavorite);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    final products =
        showOnlyFavorite ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //This will work if the data recycle in long list.
        value: products[i],
        child: ProductItem(
            //products[i].id,
            //products[i].title,
            //products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
