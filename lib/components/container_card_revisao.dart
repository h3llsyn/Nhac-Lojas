import 'package:flutter/material.dart';

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
    // Esse componente tem o próprio visual embutido (fundo branco, cantos
    // arredondados, padding) — não depende mais de nenhum outro componente
    // de "card" por baixo.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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