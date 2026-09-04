import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/filter_tag.dart';
import 'package:nhac_lojas/components/search_container.dart';

class CardapioCheioPage extends StatefulWidget {
  const CardapioCheioPage({super.key});

  @override
  State<CardapioCheioPage> createState() => _CardapioCheioPageState();
}

class _CardapioCheioPageState extends State<CardapioCheioPage> {
  bool xBurguerDisponivel = true;
  bool xBaconDisponivel = true;
  bool xSaladaDisponivel = true;
  bool batataDisponivel = true;
  bool cocaDisponivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
          child: Column(
            children: [
              // 1. Cabeçalho
              Row(
                children: [
                  const BackArrow(),
                  SizedBox(width: 16.w),
                  Text(
                    'Cardápio',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // 2. Campo de busca
              SearchContainer(label: 'Buscar produto...'),
              SizedBox(height: 12.h),

              // 3. Tags de filtro horizontais
              SizedBox(
                height: 36.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const FilterTag(filtro: 'Todos', isSelected: true),
                    SizedBox(width: 8.w),
                    const FilterTag(filtro: 'Combos'),
                    SizedBox(width: 8.w),
                    const FilterTag(filtro: 'Prato Principal'),
                    SizedBox(width: 8.w),
                    const FilterTag(filtro: 'Acompanhamentos'),
                    SizedBox(width: 8.w),
                    const FilterTag(filtro: 'Sobremesas'),
                    SizedBox(width: 8.w),
                    const FilterTag(filtro: 'Bebidas'),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // 4. Lista Rolável com os produtos (Substitui o Container fixo + Spacer)
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          ContainerNhac(
                            icon: Icons.food_bank,
                            informacao: 'X-Burguer',
                            preco: 28.90,
                            exibirSwitch: true,
                            ativoInicial: xBurguerDisponivel,
                            onSwitchChanged: (valor) {
                              setState(() {
                                xBurguerDisponivel = valor;
                              });
                            },
                            exibirSeta: true,
                          ),
                          SizedBox(height: 8.h),
                          const Divider(),
                          SizedBox(height: 8.h),
                          ContainerNhac(
                            icon: Icons.food_bank,
                            informacao: 'X-Bacon',
                            preco: 32.90,
                            exibirSwitch: true,
                            ativoInicial: xBaconDisponivel,
                            onSwitchChanged: (valor) {
                              setState(() {
                                xBaconDisponivel = valor;
                              });
                            },
                            exibirSeta: true,
                          ),
                          SizedBox(height: 8.h),
                          const Divider(),
                          SizedBox(height: 8.h),
                          ContainerNhac(
                            icon: Icons.food_bank,
                            informacao: 'X-Salada',
                            preco: 28.90,
                            exibirSwitch: true,
                            ativoInicial: xSaladaDisponivel,
                            onSwitchChanged: (valor) {
                              setState(() {
                                xSaladaDisponivel = valor;
                              });
                            },
                            exibirSeta: true,
                          ),
                          SizedBox(height: 8.h),
                          const Divider(),
                          SizedBox(height: 8.h),
                          ContainerNhac(
                            icon: Icons.food_bank,
                            informacao: 'Batata Frita Média',
                            preco: 12.00,
                            exibirSwitch: true,
                            ativoInicial: batataDisponivel,
                            onSwitchChanged: (valor) {
                              setState(() {
                                batataDisponivel = valor;
                              });
                            },
                            exibirSeta: true,
                          ),
                          SizedBox(height: 8.h),
                          const Divider(),
                          SizedBox(height: 8.h),
                          ContainerNhac(
                            icon: Icons.food_bank,
                            informacao: 'Coca-Cola 350ml',
                            preco: 4.49,
                            complemento: 'Indisponível',
                            exibirSwitch: true,
                            ativoInicial: cocaDisponivel,
                            onSwitchChanged: (valor) {
                              setState(() {
                                cocaDisponivel = valor;
                              });
                            },
                            exibirSeta: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 5. Botão de Ação fixo no rodapé
              SizedBox(height: 12.h),
              ButtonNhac(
                texto: '+ Adicionar produto',
                onTap: () => context.go('/cadastrar-produtos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}