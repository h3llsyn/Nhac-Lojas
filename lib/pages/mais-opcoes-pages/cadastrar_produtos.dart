import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/filter_tag.dart';
import 'package:nhac_lojas/components/icon_container.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class CadastrarProdutos extends StatefulWidget {
  const CadastrarProdutos({super.key});

  @override
  State<CadastrarProdutos> createState() => _CadastrarProdutosState();
}

class _CadastrarProdutosState extends State<CadastrarProdutos> {
  // Variável de estado para controlar o switch do produto disponível
  bool produtoDisponivel = true;

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
                      SizedBox(height: 4),
                      Text(
                        'Adicionar foto do produto',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent
                        ),
                      ),
                      SizedBox(height: 4),
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
                SizedBox(height: 16),
                Text(
                  'Nome do produto',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                NhacInputField(
                  hintText: 'Ex: X-Burguer',
                ),
                const SizedBox(height: 16),
                Text(
                  'Descrição',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                NhacInputField(
                  hintText: 'Descreva os ingredientes e detalhes',
                  maxLines: 3,
                ),
                SizedBox(height: 16),
                Text(
                  'Categoria',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    FilterTag(
                      filtro: 'Lanches',
                      isSelected: true,
                      selectedBackgroundColor: Colors.redAccent,
                    ),
                    FilterTag(
                      filtro: 'Bebidas',
                    ),
                    FilterTag(
                      filtro: 'Sobremesas',
                    ),
                    FilterTag(
                      filtro: 'Acompanhamentos',
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preço',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 4),
                          NhacInputField(
                            hintText: 'R\$ 0,00',
                          ),
                        ],
                      ) 
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Desconto (opcional)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 4),
                          NhacInputField(
                            hintText: '0%',
                          ),
                        ],
                      ) 
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ContainerNhac(
                    informacao: 'Disponível',
                    complemento: 'Produto aparece no cardápio',
                    exibirSwitch: true,
                    ativoInicial: produtoDisponivel,
                    onSwitchChanged: (valor) {
                      setState(() {
                        produtoDisponivel = valor;
                      });
                    },
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 49.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: Colors.redAccent.withOpacity(0.4), // Bordinha vermelha suave
                            width: 1.2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.redAccent,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12), // Um pequeno espaçamento entre a lixeira e o botão salvar
                    Expanded(
                      flex: 4,
                      child: ButtonNhac(
                        texto: 'Salvar produto',
                        onTap: () => context.pop('/cardapio-cheio'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}