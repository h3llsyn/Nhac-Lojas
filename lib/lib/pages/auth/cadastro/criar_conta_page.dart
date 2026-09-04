import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({super.key});

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  bool _senhaVisivel = false;
  bool _confirmarSenhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BackArrow(),
                    SizedBox(width: 12.w),
                    Text(
                      'Criar conta',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Crie seu acesso',
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Esse e-mail e senha serão usados para você entrar na sua conta depois.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  'Nome completo',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                const NhacInputField(
                  hintText: 'Nome',
                ),
                SizedBox(height: 16.h),
                Text(
                  'E-mail',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                const NhacInputField(
                  hintText: 'E-mail',
                ),
                SizedBox(height: 16.h),
                Text(
                  'Telefone',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                const NhacInputField(
                  hintText: '(00) 00000-0000',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Nova senha',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                NhacInputField(
                  hintText: 'Mínimo 8 caracteres',
                  obscureText: !_senhaVisivel,
                  suffixIcon: IconButton(
                    icon: _senhaVisivel
                        ? Icon(Icons.visibility, color: const Color(0xFFFF6961), size: 24.sp)
                        : SvgPicture.asset(
                            'assets/images/olho-fechado.svg',
                            width: 24.w,
                            height: 24.h,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFC9BCBC),
                              BlendMode.srcIn,
                            ),
                          ),
                    onPressed: () {
                      setState(() {
                        _senhaVisivel = !_senhaVisivel;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Confirmar nova senha',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                NhacInputField(
                  hintText: 'Repita a senha',
                  obscureText: !_confirmarSenhaVisivel,
                  suffixIcon: IconButton(
                    icon: _confirmarSenhaVisivel
                        ? Icon(Icons.visibility, color: const Color(0xFFFF6961), size: 24.sp)
                        : SvgPicture.asset(
                            'assets/images/olho-fechado.svg',
                            width: 24.w,
                            height: 24.h,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFC9BCBC),
                              BlendMode.srcIn,
                            ),
                          ),
                    onPressed: () {
                      setState(() {
                        _confirmarSenhaVisivel = !_confirmarSenhaVisivel;
                      });
                    },
                  ),
                ),
                SizedBox(height: 32.h),
                ButtonNhac(
                  texto: 'Continuar',
                  onTap: () => context.push('/confirmar-email'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}