import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/filter_tag.dart';
import 'package:nhac_lojas/components/icon_container.dart';
import 'package:nhac_lojas/controllers/scroll_shell_controller.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollShellController.of(context),
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
                  icon: Icons.search_rounded,
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            ContainerCardDesign(
              children: ContainerNhac(
                letrasIcon: 'MS',
                informacao: 'Maria Silva',
                complemento: 'Olá, poderia enviar mais molho, por favor?',
                horario: '12:35',
                statusMensagem: StatusMensagem.naoLida,
                formatoIcone: BoxShape.circle,
                quantidadeMensagens: 2,
                onTap: () => context.push('/chat-open'),
              ),
            ),
            SizedBox(height: 12,),
            ContainerCardDesign(
              children: ContainerNhac(
                letrasIcon: 'JP',
                informacao: 'João Pedro',
                complemento: 'Obrigado!',
                horario: '11:50',
                formatoIcone: BoxShape.circle,
                statusMensagem: StatusMensagem.enviada,
                onTap: () => context.push('/chat-open'),
              ),
            ),
            SizedBox(height: 12,),
            ContainerCardDesign(
              children: ContainerNhac(
                letrasIcon: 'AC',
                informacao: 'Ana Clara',
                complemento: 'Qual o tempo médio de entrega?',
                horario: 'Ontem',
                formatoIcone: BoxShape.circle,
                statusMensagem: StatusMensagem.naoLida,
                quantidadeMensagens: 1,
                onTap: () => context.push('/chat-open'),
              ),
            ),
            SizedBox(height: 12,),
            ContainerCardDesign(
              children: ContainerNhac(
                letrasIcon: 'LM',
                informacao: 'Lucas Martins',
                complemento: 'Pode deixar na portaria',
                horario: 'Ontem',
                formatoIcone: BoxShape.circle,
                statusMensagem: StatusMensagem.visualizada,
                onTap: () => context.push('/chat-open'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}