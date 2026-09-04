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
                      fontSize: 16.sp,
                      color: const Color(0xFFFE645C),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        constraints: BoxConstraints(maxHeight: 366.h),
                        child: Center(
                          child: Image.asset(
                            'assets/images/lanche-bem-vindo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 32.h),
                    ButtonNhac(
                      texto: 'Cadastrar minha loja',
                      onTap: () => context.push('/criar-conta'),
                    ),
                    SizedBox(height: 16.h),
                    ButtonNhac(
                      texto: 'Já tenho uma conta · Entrar',
                      isSecundario: true,
                      onTap: () => context.push('/login'),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Precisa de ajuda? ',
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                        Text(
                          'Fale conosco',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
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
