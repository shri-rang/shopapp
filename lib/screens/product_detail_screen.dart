import 'package:flutter/material.dart';

import '../providers/products.dart';
import 'package:provider/provider.dart';


class ProductDetailScreen extends StatelessWidget {
  static const routeName ='/product-Detail';

  @override
  Widget build(BuildContext context) {
   final productID = ModalRoute.of(context).settings.arguments as String;
   final loadedProduct=Provider.of<Products>(
     context,
     listen:false).
     findById(productID);  

    return Scaffold(
    appBar:AppBar(
      title: Text(loadedProduct.title),
    ),
    body: SingleChildScrollView(
          child: Column(children: <Widget>[
               Container(
                 height: 300,
                 width: double.infinity,
                 child: Image.network(
                    loadedProduct.imageUrl,
                    fit: BoxFit.cover,
                 ),
               ),
           SizedBox(width:10),
           Text('\$${loadedProduct.price}',
           style: TextStyle(
             color:Colors.grey,
            fontSize: 20,
           ),
            ),
            SizedBox(width:10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal:10,
                vertical: 5
                ),
               width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
                ),  
            ),

          ],)



    ),

    );
  }
}