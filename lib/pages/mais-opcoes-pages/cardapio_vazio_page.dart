import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';

class CardapioVazioPage extends StatelessWidget {
  const CardapioVazioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
          child: Column(
            children: [
              Row(
                children: [
                  const BackArrow(),
                  SizedBox(width: 16.w),
                  Text(
                    'Cardápio',
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140.w,
                      height: 140.w,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 213, 213),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.flatware_outlined,
                        size: 60.sp,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Seu cardápio está vazio',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Adicione produtos com fotos, preços\ne descrição para seus clientes\nverem na loja.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    ButtonNhac(
                      texto: 'Adicionar produto',
                      onTap: () => context.push('/cadastrar-produtos'),
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
