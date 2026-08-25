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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 46, 20,32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BackArrow(),
                const SizedBox(width: 12),
                const Text(
                  'Editar informações',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Color.fromARGB(
                    255,
                    255,
                    242,
                    230,
                  ), // Opcional: cor de fundo caso a imagem tenha transparência
                  child: ClipOval(
                    child: SizedBox(
                      width: 46,
                      height: 46,
                      child: fotoPerfil != null
                          ? Image.file(fotoPerfil!, fit: BoxFit.cover)
                          : Image.asset(
                              'assets/images/nhac-logo.png',
                              fit: BoxFit
                                  .contain, // Ajusta o logo do Nhac perfeitamente sem distorcer
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Foto ou logo da loja',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Alterar foto',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Nome da loja',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            NhacInputField(controller: nomeLojaController),
            const SizedBox(height: 16),
            Text(
              'Categoria',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 8,
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
            const SizedBox(height: 16),
            Text(
              'Categoria',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            NhacInputField(controller: descricaoLojaController, maxLines: 3,),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ButtonNhac(
                    texto: 'Cancelar',
                    onTap: () => context.pop('/informacao-loja'),
                    isSecundario: true,
                  ),
                ),
                SizedBox(width: 8,),
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
    );
  }
}
