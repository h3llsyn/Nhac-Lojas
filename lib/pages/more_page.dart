import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/icon_container.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.store_outlined,
                informacao: 'Informações da loja',
                complemento: 'Endereço, categoria e mais',
                exibirSeta: true,
                onTap: () => context.push('/informacao-loja'),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.fastfood_outlined,
                informacao: 'Cardápio',
                complemento: 'Gerencie seus produtos',
                exibirSeta: true,
                onTap: () => context.push('/cardapio-vazio'),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.trending_up,
                informacao: 'Financeiro',
                complemento: 'Saldo, repasses e taxas',
                exibirSeta: true,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.star_outline,
                informacao: 'Avaliações',
                complemento: 'Veja o que os clientes dizem',
                exibirSeta: true,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.access_time,
                informacao: 'Horário e funcionamento',
                complemento: 'Configure seus horários',
                exibirSeta: true,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.discount_outlined,
                informacao: 'Cupons e promoções',
                complemento: 'Crie e gerencia promoções',
                exibirSeta: true,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.people,
                informacao: 'Funcionários',
                complemento: 'Gerencie sua equipe',
                exibirSeta: true,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.print_outlined,
                informacao: 'Impressoras',
                complemento: 'Gerencie suas impressoras',
                exibirSeta: true,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.settings,
                informacao: 'Configurações',
                complemento: 'Preferências do aplicativo',
                exibirSeta: true,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: ContainerNhac(
                icon: Icons.headphones_outlined,
                informacao: 'Suporte',
                complemento: 'Fale com nosso suporte',
                exibirSeta: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}