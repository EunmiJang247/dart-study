import 'package:flutter/material.dart';

class TabbarPract2SecondPage extends StatefulWidget {
  const TabbarPract2SecondPage({super.key});

  @override
  State<TabbarPract2SecondPage> createState() => _TabbarPract2SecondPageState();
}

class _TabbarPract2SecondPageState extends State<TabbarPract2SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          title: Text('두 번째'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'images/pikachu-2.jpg',
                          ),
                          radius: 70,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'images/pikachu-3.jpg',
                          ),
                          radius: 70,
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
