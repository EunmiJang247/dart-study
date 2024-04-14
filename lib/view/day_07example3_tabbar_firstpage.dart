import 'package:flutter/material.dart';

class TabbarPract2FirstPage extends StatefulWidget {
  const TabbarPract2FirstPage({super.key});

  @override
  State<TabbarPract2FirstPage> createState() => _TabbarPract2FirstPageState();
}

class _TabbarPract2FirstPageState extends State<TabbarPract2FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          title: Text('첫 번째'),
          backgroundColor: Colors.red,
        ),
        body: const Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pikachu-1.jpg',
                  ),
                  radius: 70,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pikachu-2.jpg',
                  ),
                  radius: 70,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pikachu-3.jpg',
                  ),
                  radius: 70,
                ),
              ],
            ),
          ),
        ));
  }
}
