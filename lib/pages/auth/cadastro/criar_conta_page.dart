import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({super.key});

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {

  bool _senhaVisivel = false;
  bool _confirmarSenhaVisivel = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackArrow(),
                  const SizedBox(width: 12),
                  const Text(
                    'Criar conta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Crie seu acesso',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Esse e-mail e senha serão usados para você entrar na sua conta depois.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Nome completo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: 'Nome',
              ),
              const SizedBox(height: 16),
              Text(
                'E-mail',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: 'E-mail',
              ),
              const SizedBox(height: 16),
              Text(
                'Telefone',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: '(00) 00000-0000',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Text(
                'Nova senha',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: 'Mínimo 8 caracteres',
                obscureText: !_senhaVisivel,
                suffixIcon: IconButton(
                  icon: _senhaVisivel
                      ? const Icon(Icons.visibility, color: Color(0xFFFF6961))
                      : SvgPicture.asset(
                          'assets/images/olho-fechado.svg',
                          width: 24.0,
                          height: 24.0,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFC9BCBC),
                            BlendMode.srcIn,
                          ),
                        ),
                  onPressed: () {
                    setState(() {
                      _senhaVisivel = !_senhaVisivel;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Confirmar nova senha',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: 'Repita a senha',
                obscureText: !_confirmarSenhaVisivel,
                suffixIcon: IconButton(
                  icon: _confirmarSenhaVisivel
                      ? const Icon(Icons.visibility, color: Color(0xFFFF6961))
                      : SvgPicture.asset(
                          'assets/images/olho-fechado.svg',
                          width: 24.0,
                          height: 24.0,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFC9BCBC),
                            BlendMode.srcIn,
                          ),
                        ),
                  onPressed: () {
                    setState(() {
                      _confirmarSenhaVisivel = !_confirmarSenhaVisivel;
                    });
                  },
                ),
              ),
              Spacer(),
              ButtonNhac(
                texto: 'Continuar',
                onTap: () => context.push('/confirmar-email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}