import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/container_card_design.dart';

class ContainerCardRevisao extends StatelessWidget {
  final String title;
  final VoidCallback? onEdit;
  final Widget child;

  const ContainerCardRevisao({
    required this.title,
    required this.child,
    this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerCardDesign(
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: const Text(
                  'Editar',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}