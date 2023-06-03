// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/data.dart';
import 'package:frontend/globals.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/src/customer/home/categories.dart';
import 'package:frontend/src/customer/home/categoriesdetails.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  CustomerHomePageState createState() => CustomerHomePageState();
}

String bannerImage =
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?crop&w=1050&q=80";

class CustomerHomePageState extends State<CustomerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seatopia"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.mapRoute);
            },
            icon: const Icon(Icons.location_pin),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // _buildSearchBar(),
          const SizedBox(height: 10),
          _buildBanner(),
          const SizedBox(height: 10),
          _buildHeading("Categories"),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return _buildItem(index);
              },
            ),
          ),
          const SizedBox(height: 10),
          _buildHeading("Popular"),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  _buildHorizontalItem(String text, String image) {
    return Container(
      margin:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  width: 0.25 * getHeight(context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  _buildItem(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriesDetails()),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(names[index]),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  _buildHeading(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllCategories()),
              );
            },
            child: Text(
              "View All",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }

  _buildBanner() {
    return SizedBox(
        height: 0.25 * getHeight(context),
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: SizedBox(
                  height: double.infinity,
                  width: 0.9 * getWidth(context),
                  child: Image.asset(
                    index == 0 ? "assets/banner2.png" : "assets/banner1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
