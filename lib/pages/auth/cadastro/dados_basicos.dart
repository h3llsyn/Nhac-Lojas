import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';
import 'package:nhac_lojas/components/register_steps.dart';

class DadosBasicos extends StatefulWidget {
  const DadosBasicos({super.key});

  @override
  State<DadosBasicos> createState() => _DadosBasicosState();
}

class _DadosBasicosState extends State<DadosBasicos> {
  final TextEditingController tipoEstabelecimentoController = TextEditingController();
  final TextEditingController tipoCulinariaController = TextEditingController();

  @override
  void dispose() {
    tipoEstabelecimentoController.dispose();
    tipoCulinariaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Posicionado corretamente dentro do Scaffold
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
                RegisterSteps(passoAtual: PassoCadastrar.dados),
                const SizedBox(height: 18),
                const Text(
                  'Dados básicos',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Vamos começar com algumas informações sobre sua loja.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 76,
                          height: 76,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 213, 213),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 24,
                            color: Colors.redAccent,
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 231, 229),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Foto de perfil',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Logo ou foto da fachada da loja',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text(
                  'Nome da loja',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const NhacInputField(hintText: 'Ex: Nhac Burguer'),
                const SizedBox(height: 16),
                const Text(
                  'Descrição da loja',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const NhacInputField(hintText: 'Conte um pouco sobre a sua loja...'),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '0/150',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Tipo de estabelecimento',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                NhacInputField(
                  controller: tipoEstabelecimentoController,
                  hintText: 'Selecione',
                  readOnly: true,
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              title: const Text('Restaurante'),
                              onTap: () {
                                tipoEstabelecimentoController.text = 'Restaurante';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Lanchonete'),
                              onTap: () {
                                tipoEstabelecimentoController.text = 'Lanchonete';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Padaria'),
                              onTap: () {
                                tipoEstabelecimentoController.text = 'Padaria';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Mercado/conveniência'),
                              onTap: () {
                                tipoEstabelecimentoController.text = 'Mercado/conveniência';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Farmácia'),
                              onTap: () {
                                tipoEstabelecimentoController.text = 'Farmácia';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Pet shop'),
                              onTap: () {
                                tipoEstabelecimentoController.text = 'Pet shop';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Loja de bebidas'),
                              onTap: () {
                                tipoEstabelecimentoController.text = 'Loja de bebidas';
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Culinária / Categoria',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                NhacInputField(
                  controller: tipoCulinariaController,
                  hintText: 'Selecione',
                  readOnly: true,
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              title: const Text('Hamburgueria'),
                              onTap: () {
                                tipoCulinariaController.text = 'Hamburgueria';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Pizzaria'),
                              onTap: () {
                                tipoCulinariaController.text = 'Pizzaria';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Japonesa'),
                              onTap: () {
                                tipoCulinariaController.text = 'Japonesa';
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Doceria'),
                              onTap: () {
                                tipoCulinariaController.text = 'Doceria';
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
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