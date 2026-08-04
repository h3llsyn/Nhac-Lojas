import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 242, 230),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '🍔',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ]
        )
      )
    );
  }
}