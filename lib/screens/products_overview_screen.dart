import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_grid.dart';
import 'package:provider/provider.dart';
import '../screens/cartscreen.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';


enum FilterOptions{
Favorite,
All
}


class ProductsOverviewScreen extends StatefulWidget {


  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title:Text('My Shop'),
    actions: <Widget>[
     PopupMenuButton(
       onSelected: (FilterOptions selectedValue){
         setState(() {
           if (selectedValue==FilterOptions.Favorite) {
           _showOnlyFavorites = true;
         } else {
            _showOnlyFavorites = false;
                    }

         });
         
       },
       icon: Icon(Icons.more_vert,),
       itemBuilder: (_)=>
         
           [PopupMenuItem(child:Text('Only Favrouites'), value:FilterOptions.Favorite,),
           PopupMenuItem(child:Text('Show All'), value:FilterOptions.All,),
           ],
       ),
        Consumer<Cart>(
          builder:(_ , cart,ch)=>Badge(
            child:ch,
             value: cart.itemCount.toString()
            ),
           child:  IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
           )
        )
        
        
     
    ],
    
    ),
    drawer: AppDrawer(),

    body:ProductGrid(_showOnlyFavorites),
    );
  }
}


