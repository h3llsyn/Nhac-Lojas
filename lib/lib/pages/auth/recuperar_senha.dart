import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class RecuperarSenha extends StatelessWidget {
  const RecuperarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const BackArrow(),
                    SizedBox(width: 12.w),
                    Text(
                      'Recuperar senha',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 48.h),
                Container(
                  width: 160.w,
                  height: 160.w,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 213, 213),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.redAccent,
                      size: 56.sp,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Digite seu e-mail ou telefone que\nenviaremos um link para redefini-lá.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'E-mail ou telefone',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 4.h),
                const NhacInputField(hintText: 'Email'),
                SizedBox(height: 32.h),
                ButtonNhac(
                  texto: 'Enviar link',
                  onTap: () => context.push('/link-recuperacao'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
