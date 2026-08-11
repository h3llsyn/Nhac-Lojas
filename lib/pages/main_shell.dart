import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/navbar.dart';
import 'package:nhac_lojas/components/scroll_top_button.dart';

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  bool _isScrolledDown = false;
  ScrollController? _activeScrollController;

  final _items = const [
    NavBarItem(icon: Icons.house_outlined, label: 'Início'),
    NavBarItem(icon: Icons.receipt_long_outlined, label: 'Pedidos'),
    NavBarItem(icon: Icons.chat_outlined, label: 'Chat'),
    NavBarItem(icon: Icons.person_outline, label: 'Perfil'),
  ];

  @override
  void didUpdateWidget(covariant MainShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sempre que o widget filho mudar (ex: abriu detalhamento de pedido), reseta o botão
    if (oldWidget.child != widget.child) {
      setState(() {
        _isScrolledDown = false;
      });
    }
  }

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
      _isScrolledDown = false;
    });

    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/orders');
        break;
      case 2:
        context.go('/chat');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  void _scrollToTop() {
    if (_activeScrollController != null && _activeScrollController!.hasClients) {
      _activeScrollController!.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.axis == Axis.vertical) {
            // Guarda a referência do controller da scroll view ativa
            if (notification.context != null) {
              final controller = PrimaryScrollController.of(notification.context!);
              _activeScrollController = controller;
            }

            // Se a tela não possui scroll suficiente (> 150px), garante que o botão fique oculto
            if (notification.metrics.maxScrollExtent < 150) {
              if (_isScrolledDown) setState(() => _isScrolledDown = false);
              return false;
            }

            // Atualiza visibilidade do botão de voltar ao topo com base na posição
            if (notification.metrics.pixels > 150 && !_isScrolledDown) {
              setState(() => _isScrolledDown = true);
            } else if (notification.metrics.pixels <= 150 && _isScrolledDown) {
              setState(() => _isScrolledDown = false);
            }
          }
          return false;
        },
        child: Stack(
          children: [
            widget.child,
            ScrollToTopButton(
              visible: _isScrolledDown,
              onTap: _scrollToTop,
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 20,
              child: FloatingNavBar(
                items: _items,
                selectedIndex: _selectedIndex,
                onItemTap: _onNavTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}