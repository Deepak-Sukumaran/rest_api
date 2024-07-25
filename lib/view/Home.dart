// ignore_for_file: prefer_const_constructors

import 'package:api_integration/controller/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/ProductTile.dart';

class Home extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: DrawerButton(),
        title: Text("Home"),
      ),
      body: SizedBox(
        child: Obx(
          // Obx is to make the widget observble
          () {
            if (productController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
