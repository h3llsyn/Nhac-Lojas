import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class EmailLoja extends StatefulWidget {
  const EmailLoja({super.key});

  @override
  State<EmailLoja> createState() => _EmailLojaState();
}

class _EmailLojaState extends State<EmailLoja> {
  bool _senhaVisivel = false;

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
                    'Entrar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Acesse sua conta',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Digite seus dados para entrar',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'E-mail ou telefone',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(hintText: 'Email'),
              const SizedBox(height: 16),
              Text(
                'Senha',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NhacInputField(
                hintText: 'Senha',
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
              SizedBox(
                height: 35.0,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Recuperação de senha estará disponível em breve.')),
                      );
                    },
                    child: TextButton(
                      child: Text('Esqueceu sua senha?',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFFFF6961),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: (){
                        context.push('/recuperar-senha');
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 30,
                      endIndent: 10,
                    ),
                  ),
                  const Text(
                    "Ou",
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 99, 99),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              ButtonNhac(
                texto: 'Continuar com o Google',
                isSecundario: true,
                icone: SvgPicture.asset(
                  'assets/images/google-logo.svg',
                  height: 24.0,
                  width: 24.0,
                ),
                onTap: () => context.go('/home'),
              ),
              Spacer(),
              const SizedBox(height: 24,),
              ButtonNhac(
                texto: 'Continuar',
                onTap: () => context.go('/home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
