import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_item.dart';


class ProductGrid extends StatelessWidget {
final bool showFavs;

ProductGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
   final productdata=Provider.of<Products>(context);
   final product =showFavs ? productdata.favoriteitem : productdata.item;
    return 
     GridView.builder(
      
      padding: EdgeInsets.all(10.0),
      itemCount: product.length,
      itemBuilder: (ctx, i)=> ChangeNotifierProvider.value(
         value: product[i],
         child: ProductItem(
          //  product[i].id,
          //  product[i].title,
          //  product[i].imageUrl,

      ), ), 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),

    );
  }
}
