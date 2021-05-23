import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/controller/disciplina_controller.dart';
import 'package:agenda_estudante/view/disciplina/cadastro_disciplina.dart';
import 'package:agenda_estudante/view/disciplina/card_disciplina.dart';
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
    super.initState();
    controller.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Dashboard',
      appBarLeadingIcon: Icon(Icons.home),
      body: Observer(
        builder: (context) {
          return ListView(
            children: [
              Column(
                children: List.generate(
                    controller.listDisciplina.length,
                    (index) =>
                        CardDisciplina(controller.listDisciplina[index])),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
          );
        },
      ),
      fabIcon: Icon(
        Icons.add,
        size: 50.0,
      ),
      fabNavigation: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => CadastroDisciplina())),
    );
  }
}
