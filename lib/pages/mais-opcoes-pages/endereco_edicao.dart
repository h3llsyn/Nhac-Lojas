import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class EnderecoEdicao extends StatefulWidget {
  const EnderecoEdicao({super.key});

  @override
  State<EnderecoEdicao> createState() => _EnderecoEdicaoState();
}

class _EnderecoEdicaoState extends State<EnderecoEdicao> {
  TextEditingController cepController = TextEditingController(text: '01310-100');
  TextEditingController enderecoController = TextEditingController(text: 'Rua das Flores');
  TextEditingController numeroController = TextEditingController(text: '123');
  TextEditingController complementoController = TextEditingController(text: 'Apt 45');
  TextEditingController bairroController = TextEditingController(text: 'Centro');
  TextEditingController cidadeController = TextEditingController(text: 'São Paulo');
  TextEditingController ufController = TextEditingController(text: 'SP');

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
                    'Endereço da loja',
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
                    Container(
                      width: double.infinity,
                      height: 142.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.redAccent),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.redAccent,
                            size: 32.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'CEP',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    NhacInputField(
                      controller: cepController,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Endereço',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    NhacInputField(
                      controller: enderecoController,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Número',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.h),
                              NhacInputField(controller: numeroController,),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Complemento',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.h),
                              NhacInputField(controller: complementoController),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Text(
                      'Bairro',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.h),
                    NhacInputField(controller: bairroController,),
                    SizedBox(height: 16.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cidade',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.h),
                              NhacInputField(controller: cidadeController,),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UF',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.h),
                              NhacInputField(controller: ufController,),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ],
                ),
              ),
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