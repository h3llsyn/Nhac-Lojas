import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/ballon_chat.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/filter_tag.dart';
import 'package:nhac_lojas/components/icon_container.dart';

class ChatOpen extends StatelessWidget {
  const ChatOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            children: [
              Row(
                children: const [
                  BackArrow(),
                  SizedBox(width: 16),
                  Expanded(
                    child: ContainerNhac(
                      letrasIcon: 'MS',
                      informacao: 'Maria Silva',
                      complemento: 'Online',
                      corComplemento: Colors.green,
                    ),
                  ),
                  IconContainer(
                    icon: Icons.more_horiz
                  ),
                ],
              ),    
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Hoje',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ContainerCardDesign(
                        children: const ContainerNhac(
                          icon: Icons.receipt,
                          corIcone: Colors.redAccent,
                          informacao: 'Pedido',
                          codigo: 1250,
                          quantidadeItens: 2,
                          preco: 49.90,
                          complemento: 'Em preparo',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const BallonChat(
                        texto: 'Olá! Vi que meu pedido #1250 está em preparo',
                        horario: '12:32',
                        ehMinhaMensagem: false,
                      ),
                      const BallonChat(
                        texto: 'Olá! Poderia enviar mais molho, por favor?',
                        horario: '12:35',
                        ehMinhaMensagem: false,
                      ),
                      const BallonChat(
                        texto: 'Oi Maria! Claro, já vou avisar a cozinha para caprichar no molho',
                        horario: '12:36',
                        ehMinhaMensagem: true,
                        status: StatusLeitura.lida,
                      ),
                      const BallonChat(
                        texto: 'Seu pedido sai em instantes, obrigada pela paciência',
                        horario: '12:36',
                        ehMinhaMensagem: true,
                        status: StatusLeitura.enviada,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    FilterTag(
                      filtro: 'Combinado',
                    ),
                    SizedBox(width: 8),
                    FilterTag(
                      filtro: 'Pedido a caminho',
                    ),
                    SizedBox(width: 8),
                    FilterTag(
                      filtro: 'Vou verificar',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.r),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF5D201C).withValues(alpha: 0.05),
                              blurRadius: 10.r,
                              offset: const Offset(0.0, 4.0),
                            ),
                          ],
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Digite uma mensagem...',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
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