// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'categoriesdetails.dart';

class ShopDetailsPage extends StatelessWidget {
  final Shop shop;

  ShopDetailsPage({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.shopName),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shop.shopName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              shop.address,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 4.0),
                Text(
                  shop.rating.toString(),
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Services:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // Text(
            //   shop.services,
            //   style: TextStyle(fontSize: 16.0),
            // ),
            // SizedBox(height: 16.0),
            Text(
              'Images:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // Container(
            //   height: 200.0,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: shop.images.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //         margin: EdgeInsets.only(right: 8.0),
            //         child: Image.network(
            //           shop.images[index],
            //           width: 200.0,
            //           fit: BoxFit.cover,
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
