import 'package:flutter/material.dart';

class ItemMais extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final VoidCallback? onTap;

  const ItemMais({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 242, 230),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(icon, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}