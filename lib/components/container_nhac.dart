import 'package:flutter/material.dart';

enum StatusMensagem {
  naoLida,
  enviada,
  visualizada,
}

class ContainerNhac extends StatelessWidget {
  final IconData? icon;
  final String? letrasIcon;
  final String? informacao;
  final String? complemento;
  final int? quantidadeItens;
  final String? horario;
  final double? preco;
  final int? codigo;
  final String? situacao;
  final bool exibirCirculoSituacao; // <--- NOVO
  final Color? corSituacao;
  final Color? corSituacaoFundo;
  final Color? corCirculo;
  final double? fontSize;
  final double? fontSizeComplemento;
  final double? fontSizePreco;
  final StatusMensagem? statusMensagem;
  final int? quantidadeMensagens;
  final Color? corIcone;
  final Color? corFundoIcone;
  final Color? corComplemento;
  final Color? corTitulo;
  final BoxShape formatoIcone;
  final VoidCallback? onTap;
  final bool precoEmDestaque;

  const ContainerNhac({
    super.key,
    this.icon,
    this.letrasIcon,
    this.informacao,
    this.complemento,
    this.quantidadeItens,
    this.horario,
    this.preco,
    this.codigo,
    this.situacao,
    this.exibirCirculoSituacao = true, // <--- PADRÃO TRUE
    this.corSituacao,
    this.corSituacaoFundo,
    this.corCirculo,
    this.fontSize,
    this.fontSizeComplemento,
    this.fontSizePreco,
    this.statusMensagem,
    this.quantidadeMensagens,
    this.corIcone,
    this.corFundoIcone = const Color.fromARGB(255, 255, 242, 230),
    this.corComplemento,
    this.corTitulo,
    this.formatoIcone = BoxShape.rectangle,
    this.onTap,
    this.precoEmDestaque = false,
  });

  @override
  Widget build(BuildContext context) {
    Color activeCorCirculo = corCirculo ?? Colors.transparent;
    Color activeCorSituacao = corSituacao ?? Colors.transparent;
    Color activeCorSituacaoFundo = corSituacaoFundo ?? Colors.transparent;

    if (situacao != null && corSituacao == null) {
      switch (situacao) {
        case 'Em preparo':
          activeCorCirculo = Colors.blue;
          activeCorSituacao = Colors.blue;
          activeCorSituacaoFundo = const Color.fromARGB(50, 33, 149, 243);
          break;
        case 'A caminho':
          activeCorCirculo = Colors.redAccent;
          activeCorSituacao = Colors.redAccent;
          activeCorSituacaoFundo = const Color.fromARGB(50, 255, 82, 82);
          break;
        case 'Entregue':
          activeCorCirculo = Colors.green;
          activeCorSituacao = Colors.green;
          activeCorSituacaoFundo = const Color.fromARGB(50, 76, 175, 79);
          break;
        case 'Confirmar':
          activeCorCirculo = Colors.orange;
          activeCorSituacao = Colors.orange;
          activeCorSituacaoFundo = const Color.fromARGB(50, 255, 153, 0);
          break;
      }
    }

    // Título formatado com código
    final String tituloExibicao = (codigo != null && informacao != null)
        ? '#$codigo · $informacao'
        : (informacao ?? '');

    // Formatação do subtítulo/complemento incluindo a quantidade
    String? subTituloExibicao = complemento;
    if (quantidadeItens != null) {
      final String textoItens = '${quantidadeItens}x';
      final String? precoFormatado = (preco != null && !precoEmDestaque)
          ? 'R\$ ${preco!.toStringAsFixed(2).replaceAll('.', ',')}'
          : null;

      subTituloExibicao = [
        textoItens,
        if (precoFormatado != null) precoFormatado,
        if (complemento != null) complemento,
      ].join(' · ');
    } else if (subTituloExibicao == null) {
      subTituloExibicao = complemento;
    }

    Widget content = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SÓ EXIBE A BOLINHA SE A SITUAÇÃO EXISTIR E A FLAG FOR TRUE
        if (situacao != null && exibirCirculoSituacao) ...[
          Icon(
            Icons.circle,
            size: 14,
            color: activeCorCirculo,
          ),
          const SizedBox(width: 12),
        ],

        if (icon != null || letrasIcon != null) ...[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: corFundoIcone,
              shape: formatoIcone,
              borderRadius: formatoIcone == BoxShape.rectangle
                  ? BorderRadius.circular(20)
                  : null,
            ),
            child: Center(
              child: icon != null
                  ? Icon(icon, color: corIcone)
                  : Text(
                      letrasIcon!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: corIcone ?? const Color.fromARGB(255, 93, 32, 28),
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
        ],

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (tituloExibicao.isNotEmpty)
                Text(
                  tituloExibicao,
                  maxLines: 1, // <--- EVITA QUEBRA DE LINHA
                  overflow: TextOverflow.ellipsis, // <--- ADICIONA "..."
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: corTitulo ?? const Color.fromARGB(255, 93, 32, 28),
                  ),
                ),
              if (subTituloExibicao != null) ...[
                const SizedBox(height: 2),
                Text(
                  subTituloExibicao,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: fontSizeComplemento ?? 12,
                    fontWeight: FontWeight.w500,
                    color: corComplemento ?? Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),

        if (horario != null ||
            (preco != null && (precoEmDestaque || quantidadeItens == null)) ||
            situacao != null ||
            statusMensagem != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (horario != null)
                Text(
                  horario!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              if (preco != null &&
                  situacao == null &&
                  (precoEmDestaque || quantidadeItens == null))
                Text(
                  'R\$ ${preco!.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSizePreco ?? 14,
                  ),
                ),
              if (horario != null || preco != null) const SizedBox(height: 4),

              if (situacao != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: activeCorSituacaoFundo,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    situacao!,
                    style: TextStyle(
                      color: activeCorSituacao,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              if (statusMensagem != null) _buildStatusChat(),
            ],
          ),
      ],
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }

  Widget _buildStatusChat() {
    switch (statusMensagem!) {
      case StatusMensagem.naoLida:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '${quantidadeMensagens ?? 0}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case StatusMensagem.enviada:
        return const Icon(
          Icons.done_all_rounded,
          color: Colors.redAccent,
          size: 18,
        );
      case StatusMensagem.visualizada:
        return const SizedBox(height: 18);
    }
  }
}