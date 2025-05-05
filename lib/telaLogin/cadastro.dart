import 'package:flutter/material.dart';
import 'package:projeto_pex/telaLogin/autenticar_servico.dart';

final _emailController = TextEditingController();
final _nomelController = TextEditingController();
final _senhalController = TextEditingController();
final _confirmaSenhalController = TextEditingController();
AutenticarServicos autenticarServicos = AutenticarServicos();

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('Cadastro')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white24,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  TextField(
                    controller: _nomelController,
                    decoration: InputDecoration(hintText: 'Nome'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    controller: _senhalController,
                    decoration: InputDecoration(hintText: 'Senha'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    controller: _confirmaSenhalController,
                    decoration: InputDecoration(hintText: 'Confirme sua senha'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_senhalController.text == _confirmaSenhalController.text) {
                        autenticarServicos
                            .cadastrarUsuario(
                          email: _emailController.text,
                          senha: _senhalController.text,
                          nome: _nomelController.text,
                        )
                            .then((String? erro) {
                          if(!context.mounted)return;

                          if (erro != null) {
                            final snackBar = SnackBar(
                              content: Text(erro),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);
                          } Navigator.pop(context);
                        });
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Senhas diferentes'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(snackBar);
                      }
                    },
                    child: Text('Cadastrar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
