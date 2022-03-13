import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

import '../screens/orders_screen.dart';

enum FilterOptions{
  Favorites,
  All,
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
          drawer: Drawer(
        child: ListView(
           // Important: Remove any padding from the ListView.
           padding: EdgeInsets.zero,
           children: <Widget>[
            DrawerHeader(
               decoration: BoxDecoration(
                 color: Colors.amber,
               ),
               child: Text(
                 'Hello Friend!',
                 style: TextStyle(
                    color: Colors.red,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text(
                'Shop',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () =>
                  Navigator.of(context).pop(), // Update the state of the app.
              // ...
            ),
            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.sim_card_sharp),
                title: Text(
                  'Orders',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrdersScreen())),
                 // // ...
               ),
            ),
         ],
         ),
       ),
        appBar: AppBar(
          title: Text(
            ' My Shop ',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.purple,
            
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.search,),
            //   tooltip: 'Search',
            //  onPressed: () {}),
            //   IconButton(icon: Icon(Icons.favorite),
            //    tooltip: 'Favorite',
            //  onPressed: () {}),

            //    IconButton(icon: Icon(Icons.credit_card),
            //   onPressed: () {}),
              IconButton(
               icon: Icon(
                 Icons.shopping_cart,),
               //tooltip: '',
              onPressed: () {}),

            PopupMenuButton(
              onSelected: (FilterOptions selectedValue){
                setState(() {
                  if(selectedValue == FilterOptions.Favorites){
                _showOnlyFavorites = true;
               }else {
               _showOnlyFavorites = false;
               }
                });
           //print(selectedValue)
                 },
              icon: Icon(Icons.more_vert,),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favourites'),
                  value: FilterOptions.Favorites,),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                  ),
              ],
             
            ),
          ],
          ),
         
      body:  ProductsGrid(_showOnlyFavorites),
    );
  }
}

    


//       body: GridView.builder(
//         padding: const EdgeInsets.all(10.0),
//         itemCount: loadedProducts.length,
//         itemBuilder: (ctx, i) => ProductItem( 
//           loadedProducts[i].id,
//          loadedProducts[i].title,
//           loadedProducts[i].imageUrl,
//           ),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//       ),
//     );
//     return scaffold;
//   }
// }
