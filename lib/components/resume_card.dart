import 'package:flutter/material.dart';

class ResumeCard extends StatelessWidget {
  final String numero;
  final String texto;
  final Color corNumero;

  const ResumeCard({super.key, required this.numero, required this.texto, this.corNumero = const Color.fromARGB(255, 93, 32, 28)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            numero,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: corNumero,
            ),
          ),
          Text(
            texto,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}