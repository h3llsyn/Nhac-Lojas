import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class FormasPagamentoEdicaoPage extends StatefulWidget {
  const FormasPagamentoEdicaoPage({super.key});

  @override
  State<FormasPagamentoEdicaoPage> createState() =>
      _FormasPagamentoEdicaoPageState();
}

class _FormasPagamentoEdicaoPageState extends State<FormasPagamentoEdicaoPage> {
  bool cartaoCreditoOnline = true;
  bool pixOnline = true;
  bool dinheiro = true;
  bool cartaoDebito = false;
  bool cartaoCredito = false;

  final TextEditingController chavePIXController =
      TextEditingController(text: 'contato@nhacburguer.com');

  @override
  void dispose() {
    chavePIXController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BackArrow(),
                  SizedBox(width: 12.w),
                  Text(
                    'Formas de pagamento',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      'ACEITAS NO APP',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 4.w,
                            ),
                            child: ContainerNhac(
                              informacao: 'Cartão de crédito online',
                              fontSize: 16,
                              exibirCheck: true,
                              selecionado: cartaoCreditoOnline,
                              onTap: () {
                                setState(() {
                                  cartaoCreditoOnline = !cartaoCreditoOnline;
                                });
                              },
                              onCheckChanged: (valor) {
                                setState(() {
                                  cartaoCreditoOnline = valor;
                                });
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 4.w,
                            ),
                            child: ContainerNhac(
                              informacao: 'Pix online',
                              fontSize: 16,
                              exibirCheck: true,
                              selecionado: pixOnline,
                              onTap: () {
                                setState(() {
                                  pixOnline = !pixOnline;
                                });
                              },
                              onCheckChanged: (valor) {
                                setState(() {
                                  pixOnline = valor;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'NA ENTREGA',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 4.w,
                            ),
                            child: ContainerNhac(
                              informacao: 'Dinheiro',
                              fontSize: 16,
                              exibirCheck: true,
                              selecionado: dinheiro,
                              onTap: () {
                                setState(() {
                                  dinheiro = !dinheiro;
                                });
                              },
                              onCheckChanged: (valor) {
                                setState(() {
                                  dinheiro = valor;
                                });
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 4.w,
                            ),
                            child: ContainerNhac(
                              informacao: 'Cartão de débito',
                              fontSize: 16,
                              exibirCheck: true,
                              selecionado: cartaoDebito,
                              onTap: () {
                                setState(() {
                                  cartaoDebito = !cartaoDebito;
                                });
                              },
                              onCheckChanged: (valor) {
                                setState(() {
                                  cartaoDebito = valor;
                                });
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 4.w,
                            ),
                            child: ContainerNhac(
                              informacao: 'Cartão de crédito',
                              fontSize: 16,
                              exibirCheck: true,
                              selecionado: cartaoCredito,
                              onTap: () {
                                setState(() {
                                  cartaoCredito = !cartaoCredito;
                                });
                              },
                              onCheckChanged: (valor) {
                                setState(() {
                                  cartaoCredito = valor;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Chave PIX para repasses',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    NhacInputField(
                      controller: chavePIXController,
                      prefixIcon: const Icon(Icons.key_outlined),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              ButtonNhac(
                texto: 'Salvar alterações',
                onTap: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}