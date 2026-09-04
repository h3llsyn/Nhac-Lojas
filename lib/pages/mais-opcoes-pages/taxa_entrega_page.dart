import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class TaxaEntregaPage extends StatefulWidget {
  const TaxaEntregaPage({super.key});

  @override
  State<TaxaEntregaPage> createState() => _TaxaEntregaPageState();
}

class _TaxaEntregaPageState extends State<TaxaEntregaPage> {
  bool freteGratis = false;

  final TextEditingController taxaEntregaController = TextEditingController(
    text: 'R\$ 4,00',
  );
  final TextEditingController raioMaximoController = TextEditingController(
    text: '5 km',
  );
  final TextEditingController valorMinimoFrete = TextEditingController(
    text: 'R\$ 60,00',
  );

  @override
  void dispose() {
    taxaEntregaController.dispose();
    raioMaximoController.dispose();
    valorMinimoFrete.dispose();
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
                    'Taxas de entrega',
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
                      'MODELO DE COBRANÇA',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: const ContainerNhac(
                              informacao: 'Taxa fixa',
                              corTitulo: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: const ContainerNhac(
                              informacao: 'Por distância',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // OPÇÕES 1 e 2: Ativas quando freteGratis for FALSE
                    Opacity(
                      opacity: !freteGratis ? 1.0 : 0.4,
                      child: IgnorePointer(
                        ignoring: freteGratis,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Taxa de entrega',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            NhacInputField(
                              controller: taxaEntregaController,
                              prefixIcon: const Icon(Icons.moped_outlined),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Raio máximo de entrega',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            NhacInputField(
                              controller: raioMaximoController,
                              prefixIcon: const Icon(Icons.track_changes_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // SWITCH FRETE GRÁTIS
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ContainerNhac(
                        informacao: 'Frete grátis',
                        complemento: 'Acima de um valor mínimo',
                        fontSize: 16,
                        exibirSwitch: true,
                        ativoInicial: freteGratis,
                        onSwitchChanged: (valor) {
                          setState(() {
                            freteGratis = valor;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // OPÇÃO 3: Ativa quando freteGratis for TRUE
                    Opacity(
                      opacity: freteGratis ? 1.0 : 0.4,
                      child: IgnorePointer(
                        ignoring: !freteGratis,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Valor mínimo para frete grátis',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            NhacInputField(
                              controller: valorMinimoFrete,
                              prefixIcon: const Icon(Icons.monetization_on_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Botão fixo no rodapé
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