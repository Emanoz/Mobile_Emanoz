import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/components/signout_iconbutton.dart';
import 'package:agenda_estudante/controller/disciplina_controller.dart';
import 'package:agenda_estudante/model/disciplina.dart';
import 'package:agenda_estudante/view/disciplina/cadastro_disciplina.dart';
import 'package:agenda_estudante/view/disciplina/card_disciplina.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DisciplinaController controller = DisciplinaController();

  @override
  void initState() {
    updateWidgets();
    super.initState();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      hasLeading: false,
      appBarTitle: 'Dashboard',
      appBarLeadingIcon: Icon(Icons.home),
      fabActions: [signOut(context)],
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: controller.listDisciplina.length,
              itemBuilder: (_, index) {
                var list = controller.listDisciplina;
                Disciplina disciplina = list[index];
                return CardDisciplina(disciplina);
              });
        },
      ),
      fabIcon: Icon(
        Icons.add,
        size: 50.0,
      ),
      fabNavigation: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CadastroDisciplina(controller))),
    );
  }

  void updateWidgets() async {
    await controller.findAll();
  }
}
