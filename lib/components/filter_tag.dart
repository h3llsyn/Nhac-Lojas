import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final String filtro;
  final int? quantidade;
  final bool isSelected;
  final Color? backgroundColor;
  final Color? textColor;

  const FilterTag({
    required this.filtro,
    this.quantidade,
    this.isSelected = false,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Define a cor de fundo com base nos parâmetros customizados ou no estado selecionado
    final effectiveBgColor = backgroundColor ??
        (isSelected ? const Color.fromARGB(255, 93, 32, 28) : Colors.white);

    // Define a cor do texto
    final effectiveTextColor = textColor ??
        (isSelected ? Colors.white : Colors.grey);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: effectiveBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Garante que a tag ocupe apenas o espaço necessário no Wrap
        children: [
          Text(
            filtro,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: effectiveTextColor,
            ),
          ),
          if (quantidade != null)
            Text(
              ' · $quantidade',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: effectiveTextColor,
              ),
            ),
        ],
      ),
    );
  }
}