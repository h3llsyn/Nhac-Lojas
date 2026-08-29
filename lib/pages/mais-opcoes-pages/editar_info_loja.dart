import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/filter_tag.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class EditarInfoLoja extends StatefulWidget {
  const EditarInfoLoja({super.key});

  @override
  State<EditarInfoLoja> createState() => _EditarInfoLojaState();
}

class _EditarInfoLojaState extends State<EditarInfoLoja> {
  final ImagePicker picker = ImagePicker();
  File? fotoPerfil;
  final TextEditingController nomeLojaController = TextEditingController(
    text: 'Nhac Burguer',
  );
  final TextEditingController descricaoLojaController = TextEditingController(
    text: 'Os melhores hambúrgueres artesanais da região',
  );

  @override
  void dispose() {
    nomeLojaController.dispose();
    descricaoLojaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BackArrow(),
                    SizedBox(width: 12.w),
                    Text(
                      'Editar informações',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 34.r,
                      backgroundColor: const Color.fromARGB(
                        255,
                        255,
                        242,
                        230,
                      ),
                      child: ClipOval(
                        child: SizedBox(
                          width: 46.w,
                          height: 46.w,
                          child: fotoPerfil != null
                              ? Image.file(fotoPerfil!, fit: BoxFit.cover)
                              : Image.asset(
                                  'assets/images/nhac-logo.png',
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Foto ou logo da loja',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Alterar foto',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Nome da loja',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                NhacInputField(controller: nomeLojaController),
                SizedBox(height: 16.h),
                Text(
                  'Categoria',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: const [
                    FilterTag(
                      filtro: 'Hamburgueria',
                      backgroundColor: Color.fromARGB(255, 240, 240, 240),
                      isSelected: true,
                      selectedBackgroundColor: Colors.redAccent,
                      selectedTextColor: Colors.white,
                    ),
                    FilterTag(
                      filtro: 'Pizzaria',
                      backgroundColor: Color.fromARGB(255, 240, 240, 240),
                    ),
                    FilterTag(
                      filtro: 'Japonesa',
                      backgroundColor: Color.fromARGB(255, 240, 240, 240),
                    ),
                    FilterTag(
                      filtro: 'Doces',
                      backgroundColor: Color.fromARGB(255, 240, 240, 240),
                    ),
                    FilterTag(
                      filtro: 'Marmitas',
                      backgroundColor: Color.fromARGB(255, 240, 240, 240),
                    ),
                    FilterTag(
                      filtro: 'Bebidas',
                      backgroundColor: Color.fromARGB(255, 240, 240, 240),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'Descrição',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                NhacInputField(controller: descricaoLojaController, maxLines: 3),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: ButtonNhac(
                        texto: 'Cancelar',
                        onTap: () => context.pop('/informacao-loja'),
                        isSecundario: true,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: ButtonNhac(
                        texto: 'Salvar',
                        onTap: () => context.pop('/informacao-loja'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
