import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';
import 'package:nhac_lojas/components/register_steps.dart';

class EnderecoLojaPage extends StatelessWidget {
  const EnderecoLojaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackArrow(),
                    const SizedBox(width: 12),
                    const Text(
                      'Cadastrar loja',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                RegisterSteps(passoAtual: PassoCadastrar.endereco),
                const SizedBox(height: 18),
                const Text(
                  'Endereço da loja',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Informe onde sua loja está localizada.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'CEP',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const NhacInputField(
                  hintText: '00000-000',
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Rua',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const NhacInputField(hintText: 'Nome da rua'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Número',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    const NhacInputField(hintText: '123'),
                    const Text(
                      'Complemento',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const NhacInputField(hintText: 'Opcional'),
                  ],
                ),
                SizedBox(height: 24,),
                ButtonNhac(
                  texto: 'Continuar',
                  onTap: () => context.go('/home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}