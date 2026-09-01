import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/filter_tag.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            children: [
              Row(
                children: [
                  BackArrow(),
                  SizedBox(width: 16),
                  Text(
                    'Cardápio',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF5D201C).withValues(alpha: 0.05),
                      blurRadius: 10.r,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Buscar produto...',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterTag(filtro: 'Todos', isSelected: true),
                    SizedBox(width: 8.w),
                    FilterTag(filtro: 'Combos'),
                    SizedBox(width: 8.w),
                    FilterTag(filtro: 'Prato Principal'),
                    SizedBox(width: 8.w),
                    FilterTag(filtro: 'Acompanhamentos'),
                    SizedBox(width: 8.w),
                    FilterTag(filtro: 'Sobremesas'),
                    SizedBox(width: 8.w),
                    FilterTag(filtro: 'Bebidas'),
                  ],
                ),
              ),
              SizedBox(height: 24),
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
                    Divider(),
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
                    Divider(),
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
                    Divider(),
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
                    Divider(),
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
              Spacer(),
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
