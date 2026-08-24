import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/container_nhac.dart';

class InformacaoLoja extends StatefulWidget {
  const InformacaoLoja({super.key});

  @override
  State<InformacaoLoja> createState() => _InformacaoLojaState();
}

class _InformacaoLojaState extends State<InformacaoLoja> {
  final ImagePicker picker = ImagePicker();
  File? fotoPerfil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackArrow(),
              SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Color.fromARGB(255, 255, 242, 230), // Opcional: cor de fundo caso a imagem tenha transparência
                      child: ClipOval(
                        child: SizedBox(
                          width: 84, // Defina aqui o tamanho exato que a imagem deve ter dentro do círculo
                          height: 84,
                          child: fotoPerfil != null
                              ? Image.file(
                                  fotoPerfil!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/nhac-logo.png',
                                  fit: BoxFit.contain, // Ajusta o logo do Nhac perfeitamente sem distorcer
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nhac Burguer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cozinha · Hamburgueria',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Alterar foto',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ContainerNhac(
                      icon: Icons.store_outlined,
                      informacao: 'Nome, categoria e descrição',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    ContainerNhac(
                      icon: Icons.store_outlined,
                      informacao: 'Nome, categoria e descrição',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    ContainerNhac(
                      icon: Icons.store_outlined,
                      informacao: 'Nome, categoria e descrição',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
