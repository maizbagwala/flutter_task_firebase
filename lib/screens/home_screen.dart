import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> imgList = [
    'assets/images/img1.jpeg',
    'assets/images/img2.jpeg',
  ];

  final List<Icon> categories = [
    const Icon(Icons.emoji_food_beverage),
    const Icon(Icons.directions_bike_sharp),
    const Icon(Icons.cake),
    const Icon(Icons.shopping_cart),
  ];

  final List<String> items = List<String>.generate(4, (i) => 'Item ${i+1}');

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)?.settings.arguments as UserCredential;
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text("Welcome, ${user.user?.email.toString()}",
                    style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ListView(shrinkWrap: true, children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: imgList
                        .map((item) => Container(
                      child: Center(
                          child: Image.asset(item,
                              fit: BoxFit.cover, width: 1000)),
                    ))
                        .toList(),
                  ),
                  Text("Categories ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 80.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categories
                          .map((category) => Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(30.0),
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: category))
                          .toList(),
                    ),
                  ),
                  Text("List ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ...items.map((item) => Container(
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(item))),
                    ],
                  )
                ]),
              ],
            ),
          ),
        ));
  }
}
