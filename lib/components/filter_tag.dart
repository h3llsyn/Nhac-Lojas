import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final String filtro;
  final int? quantidade;
  final bool isSelected;

  const FilterTag({required this.filtro, this.quantidade, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color.fromARGB(255, 93, 32, 28) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            filtro,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey
            ),
          ),
          if(quantidade != null)
          Text(
            ' · $quantidade',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}