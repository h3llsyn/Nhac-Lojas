import 'package:flutter/material.dart';

class ContainerOrderDetails extends StatelessWidget {
  final IconData? icon;
  final String informacao;
  final String? complemento;
  final double? preco;

  const ContainerOrderDetails({
    this.icon,
    required this.informacao,
    this.complemento,
    this.preco,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 242, 230),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(icon, color: const Color(0xFFFF8C00)),
            ),
          ),
          const SizedBox(width: 14),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                informacao,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (complemento != null) ...[
                const SizedBox(height: 2),
                Text(
                  complemento!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (preco != null)
          Text(
            'R\$ ${preco!.toStringAsFixed(2).replaceAll('.', ',')}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}