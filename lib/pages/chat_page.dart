import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/chats_card.dart';
import 'package:nhac_lojas/components/container_card.dart';
import 'package:nhac_lojas/components/filter_tag.dart';
import 'package:nhac_lojas/components/icon_container.dart';
import 'package:nhac_lojas/components/orders_card.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding( 
        padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Chats',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                IconContainer(
                  icon: Icons.search
                ),
                SizedBox(width: 8,),
                IconContainer(
                  icon: Icons.more_horiz
                ),
              ],
            ),
            SizedBox(height: 24,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterTag(
                    filtro: 'Todas',
                    quantidade: 4,
                    isSelected: true
                  ),
                  SizedBox(width: 8,),
                  FilterTag(
                    filtro: 'Pendentes',
                    quantidade: 2,
                    isSelected: false
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            ContainerCard(
              children: ChatsCard(
                letras: 'MS',
                nome: 'Maria Silva',
                mensagem: 'Olá, poderia enviar mais molho, por favor?',
                horario: '12:35',
                status: StatusMensagem.naoLida,
                quantidadeMensagens: 2,
              ),
            ),
            SizedBox(height: 12,),
            ContainerCard(
              children: ChatsCard(
                letras: 'JP',
                nome: 'João Pedro',
                mensagem: 'Obrigado!',
                horario: '11:50',
                status: StatusMensagem.enviada,
              ),
            ),
            SizedBox(height: 12,),
            ContainerCard(
              children: ChatsCard(
                letras: 'AC',
                nome: 'Ana Clara',
                mensagem: 'Qual o tempo médio de entrega?',
                horario: 'Ontem',
                status: StatusMensagem.naoLida,
                quantidadeMensagens: 1,
              ),
            ),
            SizedBox(height: 12,),
            ContainerCard(
              children: ChatsCard(
                letras: 'LM',
                nome: 'Lucas Martins',
                mensagem: 'Pode deixar na portaria',
                horario: 'Ontem',
                status: StatusMensagem.visualizada,
              ),
            ),
          ],
        ),
      ),
    );
  }
}