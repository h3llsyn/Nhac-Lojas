import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class CadastrarProdutos extends StatelessWidget {
  const CadastrarProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackArrow(),
                  SizedBox(width: 16),
                  Text(
                    'Novo produto',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 156,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.redAccent)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.redAccent,
                      size: 26,
                    ),
                    SizedBox(height: 4,),
                    Text(
                      'Adicionar foto do produto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      'PNG ou JPG, até 5MB',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Text(
                'Nome do produto',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: 'Ex: X-Burguer',
              ),
              const SizedBox(height: 24),
              Text(
                'Descrição',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: 'Descreva os ingredientes e detalhes',
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}