import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;

// ProductItem(this.id, this.title, this.imageUrl,);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen:false);
    print('product rebuilds');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
               onPressed: () {
                product.toggleFavouriteStatus();
               },
        
              // ignore: deprecated_member_use
              color: Theme.of(context).accentColor,
            ),
            child: Text('Never Changes!'),
          ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {},
              // ignore: deprecated_member_use
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      
    );
  }
}
