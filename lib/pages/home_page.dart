import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/icon_container.dart';
import 'package:nhac_lojas/controllers/scroll_shell_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollShellController.of(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
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
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Nhac Burguer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '• Loja aberta',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconContainer(
                  icon: Icons.notifications_none_rounded
                ),
              ],
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RESUMO DE HOJE',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Ver mais >',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: ContainerCardDesign(
                    children: ContainerNhac(
                      informacao: '34',
                      fontSize: 20,
                      complemento: 'Pedidos'
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ContainerCardDesign(
                    children: ContainerNhac(
                      informacao: '5',
                      fontSize: 20,
                      complemento: 'Em preparo',
                      corIcone: Colors.orange,
                    ),
                  ), 
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ContainerCardDesign(
                    children: ContainerNhac(
                      informacao: '4',
                      fontSize: 20,
                      complemento: 'A caminho',
                      corIcone: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ContainerCardDesign(
                    children: ContainerNhac(
                      informacao: '25',
                      fontSize: 20,
                      complemento: 'Concluídos',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FATURAMENTO',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'R\$ 1.284,90',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '↑ +12,5% em relação a ontem',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 60,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineTouchData: LineTouchData(enabled: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 1.0),
                              FlSpot(1, 1.2),
                              FlSpot(2, 1.1),
                              FlSpot(3, 1.8),
                              FlSpot(4, 1.5),
                              FlSpot(5, 2.1),
                              FlSpot(6, 1.8),
                              FlSpot(7, 2.0),
                            ],
                            isCurved: false,
                            color: Colors.redAccent,
                            barWidth: 2.5,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AVALIAÇÃO DA LOJA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        '4,8',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '★★★★★',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '127 avaliações',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ÚLTIMOS PEDIDOS',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Ver todos >',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            ContainerCardDesign(
              children: Column(
                children: [
                  ContainerNhac(
                    codigo: 1250,
                    informacao: 'Maria Silva',
                    quantidadeItens: 2,
                    preco: 49.90,
                    horario: '12:30',
                    situacao: 'Em preparo',
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Color.fromARGB(50, 158, 158, 158)),
                  const SizedBox(height: 8),
                  ContainerNhac(
                    codigo: 1249,
                    informacao: 'João Pedro',
                    quantidadeItens: 3,
                    preco: 62.50,
                    horario: '12:10',
                    situacao: 'A caminho',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}