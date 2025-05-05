import 'package:flutter/material.dart';
import 'package:projeto_pex/telaLogin/cadastro.dart' show TelaCadastro;

final _emailController = TextEditingController();
final _senhaController = TextEditingController();

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(height: 70, 'assets/logo.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    controller: _senhaController,
                    decoration: InputDecoration(hintText: 'Senha'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Entrar'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Esqueci minha senha'),
                  ),
                  TextButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadastro()));},
                    child: Text('Cadastrar usuário'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
