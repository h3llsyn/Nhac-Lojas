import 'package:flutter/material.dart';

class ContainerCardDesign extends StatelessWidget {
  final Widget children;

  const ContainerCardDesign({required this.children, super.key});

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