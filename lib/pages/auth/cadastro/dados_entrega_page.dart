import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';
import 'package:nhac_lojas/components/register_steps.dart';

class DadosEntregaPage extends StatefulWidget {
  const DadosEntregaPage({super.key});

  @override
  State<DadosEntregaPage> createState() => _DadosEntregaPageState();
}

class _DadosEntregaPageState extends State<DadosEntregaPage> {
  int opcaoSelecionada = 0;

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
                children: const [
                  BackArrow(),
                  SizedBox(width: 12),
                  Text(
                    'Cadastrar loja',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              RegisterSteps(passoAtual: PassoCadastrar.entrega),
              const SizedBox(height: 18),
              const Text(
                'Dados da Entrega',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Configure como sua loja irá atender os pedidos.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ContainerNhac(
                  icon: Icons.local_shipping_outlined,
                  informacao: 'Entrega própria',
                  complemento: 'Minha equipe faz as entregas',
                  exibirRadio: true,
                  selecionado: opcaoSelecionada == 0,
                  onTap: () {
                    setState(() => opcaoSelecionada = 0);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ContainerNhac(
                  icon: Icons.storefront_outlined,
                  informacao: 'Retirada no local',
                  complemento: 'Cliente retira na loja',
                  exibirRadio: true,
                  selecionado: opcaoSelecionada == 1,
                  onTap: () {
                    setState(() => opcaoSelecionada = 1);
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Raio de entrega',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const NhacInputField(hintText: '5 km'),
              const SizedBox(height: 16),
              const Text(
                'Taxa de entrega',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const NhacInputField(hintText: 'R\$ 0,00'),
              Spacer(),
              ButtonNhac(
                texto: 'Continuar',
                onTap: () => context.push('/horario-funcionamento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
