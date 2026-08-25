import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/container_nhac.dart';

class InformacaoLoja extends StatelessWidget {
  const InformacaoLoja({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackArrow(),
                  const SizedBox(width: 12),
                  Text(
                  'Informações da loja',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ],
              ),
              SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 242, 230),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/nhac-logo.png',
                        fit: BoxFit.contain,
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
                    // SizedBox(height: 4),
                    // Text(
                    //   'Alterar foto',
                    //   style: TextStyle(
                    //     color: Colors.redAccent,
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
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
                    SizedBox(height: 8,),
                    Divider(),
                    SizedBox(height: 8,),
                    ContainerNhac(
                      icon: Icons.motorcycle_outlined,
                      informacao: 'Taxas de entrega',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8,),
                    Divider(),
                    SizedBox(height: 8,),
                    ContainerNhac(
                      icon: Icons.credit_card_outlined,
                      informacao: 'Formas de pagamento',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8,),
                    Divider(),
                    SizedBox(height: 8,),
                    ContainerNhac(
                      icon: Icons.location_on_outlined,
                      informacao: 'Endereço da loja',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                    SizedBox(height: 8,),
                    Divider(),
                    SizedBox(height: 8,),
                    ContainerNhac(
                      icon: Icons.settings_outlined,
                      informacao: 'Configurações da conta',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
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
                      icon: Icons.logout_outlined,
                      informacao: 'Sair da conta',
                      fontSize: 14,
                      exibirSeta: true,
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
