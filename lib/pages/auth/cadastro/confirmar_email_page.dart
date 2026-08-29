import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/button_nhac.dart';

class ConfirmarEmailPage extends StatelessWidget {
  const ConfirmarEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 140.w,
                      height: 140.w,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 213, 213),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mail_outline_rounded,
                        size: 60.sp,
                        color: Colors.redAccent,
                      ),
                    ),
                    Positioned(
                      right: 8.w,
                      bottom: 8.h,
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 231, 229),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Confirme seu e-mail!',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      const TextSpan(text: 'Enviamos um link de confirmação para\n'),
                      TextSpan(
                        text: 'seu@email.com',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 93, 32, 28),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      const TextSpan(
                        text: '. Clique no link para\nativar sua conta e começar a vender',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        const TextSpan(text: 'Não recebeu o e-mail? Verifique sua caixa de spam ou '),
                        TextSpan(
                          text: 'reenvie o email.',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 48.h),
                ButtonNhac(
                  texto: 'Já confirmei, continuar',
                  onTap: () => context.go('/dados-basicos'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
