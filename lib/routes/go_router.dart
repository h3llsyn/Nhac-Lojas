import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/pages/chat_page.dart';
import 'package:nhac_lojas/pages/home_page.dart';
import 'package:nhac_lojas/pages/main_shell.dart';
import 'package:nhac_lojas/pages/order_details.dart';
import 'package:nhac_lojas/pages/order_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          //MUDAR PRA HOME AAAAAAAAAAAAAAAAAAA
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) => const OrderPage(),
        ),
        GoRoute(
          path: '/chat',
          builder: (context, state) => const ChatPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Perfil')),
          ),
        ),
        GoRoute(
          path: '/order-details',
          builder: (context, state) => const OrderDetails(),
        ),
      ],
    ),
  ],
);