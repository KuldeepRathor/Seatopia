// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import '../../../data.dart';
import '../../../routes.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
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
        ],
      ),
    ));
  }
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
        Text(
          "View All",
          style: TextStyle(color: Colors.grey[400]),
        ),
      ],
    ),
  );
}

_buildItem(int index) {
  return GestureDetector(
    // onTap: () =>
    //     Navigator.of(context).pushNamed(Routes.selectTimeRoute),
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
