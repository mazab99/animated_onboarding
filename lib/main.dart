import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'coustom_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final data = [
    ItemData(
      title: "Welcome 1",
      subtitle: "......",
      image: const AssetImage("assets/images/player1.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: Image.asset(
        'assets/images/player1.png',
      ),
    ),
    ItemData(
      title: "Welcome 2",
      subtitle: "...... ",
      image: const AssetImage('assets/images/player2.png'),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.orange.shade600,
      subtitleColor: Colors.white,
      background: Image.asset(
        'assets/images/player2.png',
      ),
    ),
    ItemData(
      title: "Welcome 3",
      subtitle: ".",
      image: const AssetImage('assets/images/player3.png'),
      backgroundColor: Colors.white,
      titleColor: Colors.red.shade400,
      subtitleColor: Colors.black,
      background: Image.asset(
        'assets/images/player3.png',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        radius: 40,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index, double value) {
          return ItemWidget(data: data[index]);
        },
      ),
    );
  }
}

class ItemData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  ItemData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image(image: data.image),
              ),
              const Spacer(flex: 1),
              Text(
                data.title,
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ],
    );
  }
}
