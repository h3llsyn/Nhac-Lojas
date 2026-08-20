import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/icon_container.dart';
import 'package:nhac_lojas/components/item_mais.dart';
import 'package:nhac_lojas/controllers/scroll_shell_controller.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollShellController.of(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mais',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ItemMais(
              icon: Icons.store_outlined,
              titulo: 'Informações da loja',
              subtitulo: 'Endereço, categoria e mais'
            ),
            Divider(),
            ItemMais(
              icon: Icons.fastfood_outlined,
              titulo: 'Cardápio',
              subtitulo: 'Gerencie seus produtos'
            ),
            Divider(),
            ItemMais(
              icon: Icons.trending_up,
              titulo: 'Financeiro',
              subtitulo: 'Saldo, repasses e taxas'
            ),
            Divider(),
            ItemMais(
              icon: Icons.star_outline,
              titulo: 'Avaliações',
              subtitulo: 'Veja o que os clientes dizem'
            ),
            Divider(),
            ItemMais(
              icon: Icons.access_time,
              titulo: 'Horário e funcionamento',
              subtitulo: 'Configure seus horários'
            ),
            Divider(),
            ItemMais(
              icon: Icons.discount_outlined,
              titulo: 'Cupons e promoções',
              subtitulo: 'Crie e gerencia promoções'
            ),
            Divider(),
            ItemMais(
              icon: Icons.people,
              titulo: 'Funcionários',
              subtitulo: 'Gerencie sua equipe'
            ),
            Divider(),
            ItemMais(
              icon: Icons.print_outlined,
              titulo: 'Impressoras',
              subtitulo: 'Gerencie suas impressoras'
            ),
            Divider(),
            ItemMais(
              icon: Icons.settings,
              titulo: 'Configurações',
              subtitulo: 'Preferências do aplicativo'
            ),
            Divider(),
            ItemMais(
              icon: Icons.headphones_outlined,
              titulo: 'Suporte',
              subtitulo: 'Fale com nosso suporte'
            ),
          ],
        ),
      ),
    );
  }
}