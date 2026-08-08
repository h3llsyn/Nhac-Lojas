import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Botão circular flutuante "voltar ao topo".
///
/// Não sabe nada sobre scroll — quem hospeda decide quando [visible] é true
/// (normalmente ligado ao mesmo _isScrolledDown que colapsa a FloatingNavBar)
/// e o que acontece no toque via [onTap] (ex: scrollController.animateTo(0)).
class ScrollToTopButton extends StatelessWidget {
  final bool visible;
  final VoidCallback onTap;

  /// Distância do fundo da tela quando VISÍVEL (acima da navbar colapsada).
  final double bottomOffsetVisible;

  /// Distância do fundo da tela quando ESCONDIDO (perto da navbar expandida,
  /// ainda ocupa espaço mas fica sem interação).
  final double bottomOffsetHidden;

  const ScrollToTopButton({
    super.key,
    required this.visible,
    required this.onTap,
    this.bottomOffsetVisible = 101,
    this.bottomOffsetHidden = 22.5,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      bottom: visible
          ? (bottomPadding + bottomOffsetVisible.h)
          : (bottomPadding + bottomOffsetHidden.h),
      right: 24.w + 12.5.w,
      child: GestureDetector(
        onTap: visible ? onTap : null,
        child: Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: const Color(0xFFFF6961),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6961).withValues(alpha: 0.3),
                blurRadius: 10.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_upward_rounded,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}