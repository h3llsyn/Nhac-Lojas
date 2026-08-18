import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/back_arrow.dart';

class RecuperarSenha extends StatelessWidget {
  const RecuperarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  BackArrow(),
                  const SizedBox(width: 12),
                  const Text(
                    'Recuperar senha',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 213, 213),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: const Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.redAccent,
                    size: 56,
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Text(
                'Esqueceu sua senha?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}