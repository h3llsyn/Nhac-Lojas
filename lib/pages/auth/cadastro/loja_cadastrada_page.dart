import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/button_nhac.dart';

class LojaCadastradaPage extends StatelessWidget {
  const LojaCadastradaPage({super.key});

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
                        Icons.store_outlined,
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
                  'Loja cadastrada com sucesso!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Agora é só preparar os pedidos e\nfazer seu negócio crescer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 48.h),
                ButtonNhac(
                  texto: 'Cadastrar produtos agora',
                  onTap: () => context.push('/cadastrar-produtos'),
                ),
                SizedBox(height: 16.h),
                ButtonNhac(
                  texto: 'Ir para a home',
                  onTap: () => context.go('/home'),
                  isSecundario: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}