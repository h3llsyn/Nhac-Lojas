import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/item_horario_funcionamento.dart';
import 'package:nhac_lojas/components/register_steps.dart';

class HorarioFuncionamentoPage extends StatelessWidget {
  const HorarioFuncionamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    BackArrow(),
                    SizedBox(width: 12),
                    Text(
                      'Cadastrar loja',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                RegisterSteps(passoAtual: PassoCadastrar.horarios),
                const SizedBox(height: 18),
                const Text(
                  'Horário de funcionamento',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Defina os dias e horários em que sua loja recebe pedidos.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Copiar p/ todos os dias',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const ItemHorarioFuncionamento(
                  diaSemana: 'Seg',
                  horario: '08:00 - 18:00',
                  ativoInicial: true,
                ),
                Divider(),
                const ItemHorarioFuncionamento(
                  diaSemana: 'Ter',
                  horario: '08:00 - 18:00',
                  ativoInicial: true,
                ),
                Divider(),
                const ItemHorarioFuncionamento(
                  diaSemana: 'Qua',
                  horario: '08:00 - 18:00',
                  ativoInicial: true,
                ),
                Divider(),
                const ItemHorarioFuncionamento(
                  diaSemana: 'Qui',
                  horario: '08:00 - 18:00',
                  ativoInicial: true,
                ),
                Divider(),
                const ItemHorarioFuncionamento(
                  diaSemana: 'Sex',
                  horario: '08:00 - 22:00',
                  ativoInicial: true,
                ),
                Divider(),
                const ItemHorarioFuncionamento(
                  diaSemana: 'Sáb',
                  horario: '10:00 - 22:00',
                  ativoInicial: true,
                ),
                Divider(),
                const ItemHorarioFuncionamento(
                  diaSemana: 'Dom',
                  horario: 'Fechado',
                  ativoInicial: false,
                ),
                const SizedBox(height: 24),
                ButtonNhac(
                  texto: 'Continuar',
                  onTap: () => context.push('/forma-pagamento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}