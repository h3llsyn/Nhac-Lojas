import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/container_nhac.dart';

class InformacaoLoja extends StatefulWidget {
  const InformacaoLoja({super.key});

  @override
  State<InformacaoLoja> createState() => _InformacaoLojaState();
}

class _InformacaoLojaState extends State<InformacaoLoja> {
  final ImagePicker picker = ImagePicker();
  File? fotoPerfil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 46.h, 20.w, 110.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BackArrow(),
                  SizedBox(width: 12.w),
                  Text(
                    'Informações da loja',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 64.r,
                      backgroundColor: const Color.fromARGB(255, 255, 242, 230),
                      child: ClipOval(
                        child: SizedBox(
                          width: 84.w,
                          height: 84.w,
                          child: fotoPerfil != null
                              ? Image.file(
                                  fotoPerfil!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/nhac-logo.png',
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Nhac Burguer',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cozinha · Hamburgueria',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
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
                      icon: Icons.store_outlined,
                      informacao: 'Nome, categoria e descrição',
                      fontSize: 14,
                      exibirSeta: true,
                      onTap: () => context.push('/editar-info-loja'),
                    ),
                    SizedBox(height: 8.h),
                    const Divider(),
                    SizedBox(height: 8.h),
                    const ContainerNhac(
                      icon: Icons.motorcycle_outlined,
                      informacao: 'Taxas de entrega',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8.h),
                    const Divider(),
                    SizedBox(height: 8.h),
                    const ContainerNhac(
                      icon: Icons.credit_card_outlined,
                      informacao: 'Formas de pagamento',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8.h),
                    const Divider(),
                    SizedBox(height: 8.h),
                    const ContainerNhac(
                      icon: Icons.location_on_outlined,
                      informacao: 'Endereço da loja',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8.h),
                    const Divider(),
                    SizedBox(height: 8.h),
                    const ContainerNhac(
                      icon: Icons.settings_outlined,
                      informacao: 'Configurações da conta',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
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
                      icon: Icons.logout_outlined,
                      informacao: 'Sair da conta',
                      fontSize: 14,
                      exibirSeta: true,
                      onTap: () => context.go('/bem-vindo'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
