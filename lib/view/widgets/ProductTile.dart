import 'package:api_integration/Model/ProductModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,
      child: Column(
        children: [
          Container(
            height: 118,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              fit: BoxFit.contain,
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          ListTile(
            title: Text( maxLines: 1,
              product.title!,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.category!),
                  Text("£${product.price!}", style: TextStyle(fontWeight: FontWeight.w500),),
              ],
            ),
          
          )
        ],
      ),
    );
  }
}
