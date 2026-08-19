import 'package:flutter/material.dart';

enum PassoCadastrar {
  dados,
  endereco,
  entrega,
  horarios,
  pagamento,
  revisar,
}

class RegisterSteps extends StatelessWidget {
  final PassoCadastrar passoAtual;

  const RegisterSteps({
    super.key,
    required this.passoAtual,
  });

  static const List<_StepData> _etapasPadrao = [
    _StepData(status: PassoCadastrar.dados, titulo: 'Dados'),
    _StepData(status: PassoCadastrar.endereco, titulo: 'Endereço'),
    _StepData(status: PassoCadastrar.entrega, titulo: 'Entrega'),
    _StepData(status: PassoCadastrar.horarios, titulo: 'Horários'),
    _StepData(status: PassoCadastrar.pagamento, titulo: 'Pagamento'),
    _StepData(status: PassoCadastrar.revisar, titulo: 'Revisar'),
  ];

  @override
  Widget build(BuildContext context) {
    final int indexAtual = passoAtual.index;

    return Row(
      children: List.generate(_etapasPadrao.length, (index) {
        final etapa = _etapasPadrao[index];
        final bool isCompleted = index < indexAtual;
        final bool isCurrent = index == indexAtual;
        final bool isFirst = index == 0;
        final bool isLast = index == _etapasPadrao.length - 1;

        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Linha do topo: conector esquerdo + bolinha + conector direito
              Row(
                children: [
                  // Linha conectora da esquerda
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isFirst
                          ? Colors.transparent
                          : (index <= indexAtual
                              ? const Color(0xFFFF6961)
                              : const Color(0xFFE0E0E0)),
                    ),
                  ),
                  // Circulo/Ícone central
                  _buildStatusIcon(
                    isCompleted: isCompleted,
                    isCurrent: isCurrent,
                  ),
                  // Linha conectora da direita
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isLast
                          ? Colors.transparent
                          : (isCompleted
                              ? const Color(0xFFFF6961)
                              : const Color(0xFFE0E0E0)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // Texto da etapa abaixo da bolinha
              Text(
                etapa.titulo,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                  fontSize: 11,
                  color: isCurrent || isCompleted
                      ? const Color(0xFFFF6961)
                      : const Color(0xFF9E9E9E),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStatusIcon({
    required bool isCompleted,
    required bool isCurrent,
  }) {
    if (isCompleted) {
      return Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, size: 16, color: Colors.white),
      );
    } else if (isCurrent) {
      return Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Color(0xFFFF6961),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      );
    }
  }
}

class _StepData {
  final PassoCadastrar status;
  final String titulo;

  const _StepData({
    required this.status,
    required this.titulo,
  });
}