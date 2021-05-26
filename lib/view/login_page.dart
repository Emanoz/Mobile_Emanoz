import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/components/default_text_field.dart';
import 'package:agenda_estudante/controller/firebase_auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterPage extends StatelessWidget {
  final FirebaseUserAuthController controller = FirebaseUserAuthController();
  final String modo;
  final String titulo;

  LoginAndRegisterPage({this.modo = "login", this.titulo = "Login"});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: titulo,
      hasFab: false,
      hasLeading: false,
      fabActions: [
        IconButton(
            onPressed: modo == 'login'
                ? () => controller.signIn(context)
                : () => controller.register(context),
            icon: modo == 'login'
                ? Icon(Icons.login)
                : Icon(Icons.app_registration_rounded))
      ],
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView(
          children: [
            Column(
              children: [
                DefaultTextField(
                  labelText: 'E-mail',
                  hintText: '180281@facens.br',
                  controller: controller.email,
                ),
                DefaultTextField(
                  labelText: 'Senha',
                  hintText: '********',
                  controller: controller.senha,
                  obscureText: true,
                ),
                modo == 'login'
                    ? TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LoginAndRegisterPage(
                                      modo: 'register',
                                      titulo: 'Cadastro',
                                    ))),
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
