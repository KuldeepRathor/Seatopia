// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

class Shop {
  final String shopName;
  final String address;
  final double rating;

  Shop({
    required this.shopName,
    required this.address,
    required this.rating,
  });
}

class CategoriesDetails extends StatefulWidget {
  const CategoriesDetails({super.key});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  final List<Shop> shops = [
    Shop(shopName: 'Shop 1', address: 'Address 1', rating: 4.5),
    Shop(shopName: 'Shop 2', address: 'Address 2', rating: 3.8),
    Shop(shopName: 'Shop 3', address: 'Address 3', rating: 4.2),
    // Add more shop data here
  ];

  void openShopDetailsPage(BuildContext context, Shop shop) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopDetailsPage(shop: shop),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories Details'),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),

        height: MediaQuery.of(context).size.height * 0.4,
        // color: Colors.white,
        child: ListView.builder(
          itemCount: shops.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(shops[index].shopName),
              subtitle: Text(shops[index].address),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 4.0),
                  Text(shops[index].rating.toString()),
                ],
              ),
              onTap: () => openShopDetailsPage(context, shops[index]),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Map widget or any background widget
        ],
      ),
    );
  }
}

class ShopDetailsPage extends StatelessWidget {
  final Shop shop;

  ShopDetailsPage({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Details'),
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
            // Add more shop details or widgets here
          ],
        ),
      ),
    );
  }
}
