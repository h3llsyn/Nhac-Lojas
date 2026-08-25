import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final String filtro;
  final int? quantidade;
  final bool isSelected;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? selectedBackgroundColor;
  final Color? selectedTextColor;

  const FilterTag({
    required this.filtro,
    this.quantidade,
    this.isSelected = false,
    this.backgroundColor,
    this.textColor,
    this.selectedBackgroundColor,
    this.selectedTextColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final primaryAppColor = Theme.of(context).colorScheme.primary;

    // 1. COR DE FUNDO CORRIGIDA: Se estiver selecionado, usa a cor de seleção. Se não, usa o backgroundColor ou branco.
    final effectiveBgColor = isSelected
        ? (selectedBackgroundColor ?? primaryAppColor)
        : (backgroundColor ?? Colors.white);

    // 2. COR DE TEXTO CORRIGIDA: Se estiver selecionado, usa o texto de seleção. Se não, usa o textColor ou a cor primária do app.
    final effectiveTextColor = isSelected
        ? (selectedTextColor ?? Colors.white)
        : (textColor ?? primaryAppColor);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: effectiveBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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