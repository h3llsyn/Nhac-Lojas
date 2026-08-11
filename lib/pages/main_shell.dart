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
  
  // Instância única para controlar o scroll das telas filhas com primary: true
  final ScrollController _scrollController = ScrollController();

  final _items = const [
    NavBarItem(icon: Icons.house_outlined, label: 'Início'),
    NavBarItem(icon: Icons.receipt_long_outlined, label: 'Pedidos'),
    NavBarItem(icon: Icons.chat_outlined, label: 'Chat'),
    NavBarItem(icon: Icons.person_outline, label: 'Perfil'),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MainShell oldWidget) {
    super.didUpdateWidget(oldWidget);
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
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
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
      // Fornece o _scrollController de forma segura para todas as telas internas
      body: PrimaryScrollController(
        controller: _scrollController,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.axis == Axis.vertical) {
              // Garante que o botão fique oculto caso a tela não precise de scroll
              if (notification.metrics.maxScrollExtent < 150) {
                if (_isScrolledDown) setState(() => _isScrolledDown = false);
                return false;
              }

              // Alterna a visibilidade com base na distância percorrida
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
      ),
    );
  }
}