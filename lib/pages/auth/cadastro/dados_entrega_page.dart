import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';
import 'package:nhac_lojas/components/register_steps.dart';

class DadosEntregaPage extends StatefulWidget {
  const DadosEntregaPage({super.key});

  @override
  State<DadosEntregaPage> createState() => _DadosEntregaPageState();
}

class _DadosEntregaPageState extends State<DadosEntregaPage> {
  int opcaoSelecionada = 0;

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
                      'Cadastrar loja',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                const RegisterSteps(passoAtual: PassoCadastrar.entrega),
                SizedBox(height: 18.h),
                Text(
                  'Dados da Entrega',
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Configure como sua loja irá atender os pedidos.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 18.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ContainerNhac(
                    icon: Icons.local_shipping_outlined,
                    informacao: 'Entrega própria',
                    complemento: 'Minha equipe faz as entregas',
                    exibirRadio: true,
                    selecionado: opcaoSelecionada == 0,
                    onTap: () {
                      setState(() => opcaoSelecionada = 0);
                    },
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
                  child: ContainerNhac(
                    icon: Icons.storefront_outlined,
                    informacao: 'Retirada no local',
                    complemento: 'Cliente retira na loja',
                    exibirRadio: true,
                    selecionado: opcaoSelecionada == 1,
                    onTap: () {
                      setState(() => opcaoSelecionada = 1);
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Raio de entrega',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                const NhacInputField(hintText: '5 km'),
                SizedBox(height: 16.h),
                Text(
                  'Taxa de entrega',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                const NhacInputField(hintText: 'R\$ 0,00'),
                SizedBox(height: 32.h),
                ButtonNhac(
                  texto: 'Continuar',
                  onTap: () => context.push('/horario-funcionamento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
