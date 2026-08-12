import 'package:flutter/material.dart';

class ScrollShellController extends InheritedWidget {
  final ScrollController controller;

  const ScrollShellController({
    super.key,
    required this.controller,
    required super.child,
  });

  static ScrollController of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ScrollShellController>();
    assert(result != null, 'Nenhum ScrollShellController encontrado no contexto.');
    return result!.controller;
  }

  @override
  bool updateShouldNotify(ScrollShellController oldWidget) =>
      controller != oldWidget.controller;
}
