import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonNhac extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final Widget? icone;
  final bool isSecundario;

  const ButtonNhac({
    super.key,
    required this.texto,
    this.onPressed,
    this.icone,
    this.isSecundario = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color corPrimaria = const Color(0xFFFE645C);
    final Color corEscura = const Color(0xFF5D201C);
    final Color corTextoClaro = const Color(0xFFFEE3E1);

    return SizedBox(
      width: double.infinity,
      height: 49.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSecundario ? Colors.transparent : corPrimaria,
          foregroundColor: isSecundario ? corEscura : corTextoClaro,
          elevation: 0,
          side: isSecundario ? BorderSide(color: corEscura, width: 1.w) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icone != null) ...[
              icone!,
              SizedBox(width: 8.w),
            ],
            Text(
              texto,
              style: TextStyle(
                color: isSecundario ? corEscura : corTextoClaro,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}