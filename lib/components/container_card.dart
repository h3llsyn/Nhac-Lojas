import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Widget children;

  const ContainerCard({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          children
        ]
      )
    );
  }
}