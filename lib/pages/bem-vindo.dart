import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/button_nhac.dart';

class BemVindo extends StatelessWidget {
  const BemVindo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 132.w,
                    height: 49.h,
                    child: Image.asset('assets/images/nhac-logo.png'),
                  ),
                  Text(
                    'Lojas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFE645C),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 366.h,
                    child: Center(
                      child: Image.asset(
                        'assets/images/lanche-bem-vindo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    'Bem-vindo ao Nhac Lojas!',
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: const Color(0xFF5D201C),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Faça login para acessar sua loja\nou cadastre uma nova',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0x995D201C),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 46.h),
                  SizedBox(
                    width: double.infinity,
                    height: 49.h,
                    child: ButtonNhac(
                      texto: 'Cadastrar minha loja',
                      onTap: () => context.push('/home'),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    height: 49.h,
                    child: ButtonNhac(
                      texto: 'Já tenho uma conta · Entrar',
                      isSecundario: true,
                      onTap: () => context.push('/email'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Precisa de ajuda? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Fale conosco',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
