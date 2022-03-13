import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import './screens/orders_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Products(),
           
          ),
           ChangeNotifierProvider.value(
            value: Cart(),
         
          ),
        ],
        child: MaterialApp(
            title: "Shop App",
            theme: ThemeData(
              primarySwatch: Colors.purple,
              // ignore: deprecated_member_use
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
            ),
            home: ProductsOverviewScreen(),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            }));

    //   builder: (ctx) => Products(),
    //   child: MaterialApp()
    // drawer: Drawer(
    //   child: ListView(
    //     // Important: Remove any padding from the ListView.
    //     padding: EdgeInsets.zero,
    //     children: <Widget>[
    //       DrawerHeader(
    //         decoration: BoxDecoration(
    //           color: Colors.amber,
    //         ),
    //         child: Text(
    //           'Cooking Up!',
    //           style: TextStyle(
    //               color: Colors.red,
    //               fontSize: 40.0,
    //               fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.set_meal),
    //         title: Text(
    //           'Meals',
    //           style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 20.0,
    //               fontWeight: FontWeight.bold),
    //         ),
    //         // onTap: () =>
    //         //     Navigator.of(context).pop(), // Update the state of the app.
    //         // // ...
    //       ),
    //       GestureDetector(
    //         child: ListTile(
    //           leading: Icon(Icons.settings),
    //           title: Text(
    //             'Filters',
    //             style: TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 20.0,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           // onTap: () => Navigator.push(context,
    //           //     MaterialPageRoute(builder: (context) => FilterScreen())),
    //           // // ...
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    // appBar: AppBar(
    //     title: Text(
    //       'Shop App',
    //       style: TextStyle(
    //           color: Colors.white,
    //           fontWeight: FontWeight.bold,
    //           fontStyle: FontStyle.italic),
    //     ),
    //     backgroundColor: Colors.purple,

    //     actions: <Widget>[
    //       // IconButton(icon: Icon(Icons.search,),
    //       //   tooltip: 'Search',
    //       //  onPressed: () {}),
    //       //   IconButton(icon: Icon(Icons.favorite),
    //       //    tooltip: 'Favorite',
    //       //  onPressed: () {}),

    //       //   IconButton(icon: Icon(Icons.credit_card),
    //       //  onPressed: () {}),
    //        IconButton(
    //          icon: Icon(
    //            Icons.shopping_cart,),
    //         //tooltip: '',
    //        onPressed: () {}),

    //       PopupMenuButton(
    //         onSelected: (int selectedValue){
    //          print(selectedValue);
    //         },
    //         icon: Icon(Icons.more_vert,),
    //         itemBuilder: (_) => [
    //           PopupMenuItem(
    //             child: Text('Only Favourites'),
    //             value: 0,),
    //           PopupMenuItem(
    //             child: Text('Show All'),
    //             value: 1,),
    //         ],

    //       ),
    //     ]),
  }
}
