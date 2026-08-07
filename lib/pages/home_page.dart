import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/resume_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 242, 230),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '🍔',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Nhac Burguer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '• Loja aberta',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
                  ],
                ),
                ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 242, 230),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RESUMO DE HOJE',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),
                  Text(
                    'Ver mais >',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Expanded(
                  child: ResumeCard(
                    numero: '34',
                    texto: 'Pedidos'
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ResumeCard(
                    numero: '5',
                    texto: 'Em preparo'
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