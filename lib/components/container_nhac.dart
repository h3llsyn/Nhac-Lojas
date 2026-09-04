import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final bool exibirCirculoSituacao;
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
  final bool selecionado;
  final bool exibirRadio;
  final bool exibirCheck;
  final ValueChanged<bool>? onCheckChanged; // <--- NOVO
  final bool exibirSeta;
  final bool exibirSwitch;
  final bool ativoInicial;
  final ValueChanged<bool>? onSwitchChanged;

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
    this.exibirCirculoSituacao = true,
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
    this.selecionado = false,
    this.exibirRadio = false,
    this.exibirCheck = false,
    this.onCheckChanged, // <--- NOVO
    this.exibirSeta = false,
    this.exibirSwitch = false,
    this.ativoInicial = false,
    this.onSwitchChanged,
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

    final String tituloExibicao = (codigo != null && informacao != null)
        ? '#$codigo · $informacao'
        : (informacao ?? '');

    String? subTituloExibicao = complemento;
    if (quantidadeItens != null) {
      final String textoItens = '${quantidadeItens}x';
      final String? precoFormatado = (preco != null && !precoEmDestaque)
          ? 'R\$ ${preco!.toStringAsFixed(2).replaceAll('.', ',')}'
          : null;

      subTituloExibicao = [
        textoItens,
        ?precoFormatado,
        if (complemento != null) complemento,
      ].join(' · ');
    } else {
      subTituloExibicao ??= complemento;
    }

    final Color corDestaque = Colors.redAccent;

    Widget content = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // --- CHECKBOX NO LADO ESQUERDO ---
        if (exibirCheck) ...[
          GestureDetector(
            onTap: () {
              if (onCheckChanged != null) {
                onCheckChanged!(!selecionado);
              }
            },
            child: Container(
              width: 26.r,
              height: 26.r,
              decoration: BoxDecoration(
                color: selecionado ? const Color(0xFFFF6961) : Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: selecionado ? Colors.transparent : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: selecionado
                  ? Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 18.sp,
                    )
                  : null,
            ),
          ),
          SizedBox(width: 12.w),
        ],

        if (situacao != null && exibirCirculoSituacao) ...[
          Icon(
            Icons.circle,
            size: 14.sp,
            color: activeCorCirculo,
          ),
          SizedBox(width: 12.w),
        ],

        if (icon != null || letrasIcon != null) ...[
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: corFundoIcone,
              shape: formatoIcone,
              borderRadius: formatoIcone == BoxShape.rectangle
                  ? BorderRadius.circular(16.r)
                  : null,
            ),
            child: Center(
              child: icon != null
                  ? Icon(icon, color: corIcone ?? corDestaque, size: 24.sp)
                  : Text(
                      letrasIcon!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: corIcone ?? const Color.fromARGB(255, 93, 32, 28),
                      ),
                    ),
            ),
          ),
          SizedBox(width: 12.w),
        ],

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (tituloExibicao.isNotEmpty)
                Text(
                  tituloExibicao,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (fontSize ?? 16).sp,
                    color: corTitulo ?? const Color.fromARGB(255, 93, 32, 28),
                  ),
                ),
              if (subTituloExibicao != null) ...[
                SizedBox(height: 2.h),
                Text(
                  subTituloExibicao,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: (fontSizeComplemento ?? 13).sp,
                    fontWeight: FontWeight.w400,
                    color: corComplemento ?? Colors.grey[600],
                  ),
                ),
              ],
            ],
          ),
        ),

        // MENSAGENS / SINAIS DE STATUS
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
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              if (preco != null &&
                  situacao == null &&
                  (precoEmDestaque || quantidadeItens == null))
                Text(
                  'R\$ ${preco!.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (fontSizePreco ?? 14).sp,
                  ),
                ),
              if (horario != null || preco != null) SizedBox(height: 4.h),

              if (situacao != null)
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: activeCorSituacaoFundo,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    situacao!,
                    style: TextStyle(
                      color: activeCorSituacao,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              if (statusMensagem != null) _buildStatusChat(),
            ],
          ),

        // --- RADIO SELEÇÃO ---
        if (exibirRadio) ...[
          SizedBox(width: 12.w),
          Icon(
            selecionado
                ? Icons.radio_button_checked_rounded
                : Icons.radio_button_off_rounded,
            color: selecionado ? corDestaque : Colors.grey[300],
            size: 24.sp,
          ),
        ],

        // --- SWITCH ---
        if (exibirSwitch) ...[
          SizedBox(width: 8.w),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: ativoInicial,
              activeThumbColor: Colors.white,
              activeTrackColor: const Color(0xFFFF6961),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade300,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              onChanged: onSwitchChanged,
            ),
          ),
        ],
        if (exibirSeta) ...[
          SizedBox(width: 8.w),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: 12.sp,
          ),
        ],
      ],
    );

    final VoidCallback? handleTap = onTap ??
        (onCheckChanged != null
            ? () => onCheckChanged!(!selecionado)
            : null);

    if (handleTap != null) {
      return InkWell(
        onTap: handleTap,
        child: content,
      );
    }

    return content;
  }

  Widget _buildStatusChat() {
    switch (statusMensagem!) {
      case StatusMensagem.naoLida:
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '${quantidadeMensagens ?? 0}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case StatusMensagem.enviada:
        return Icon(
          Icons.done_all_rounded,
          color: Colors.redAccent,
          size: 18.sp,
        );
      case StatusMensagem.visualizada:
        return SizedBox(height: 18.h);
    }
  }
}