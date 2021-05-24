import 'package:agenda_estudante/components/default_scaffold.dart';
import 'package:agenda_estudante/controller/disciplina_controller.dart';
import 'package:agenda_estudante/model/disciplina.dart';
import 'package:agenda_estudante/view/disciplina/cadastro_disciplina.dart';
import 'package:agenda_estudante/view/disciplina/card_disciplina.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Dashboard extends StatefulWidget {
  final DisciplinaController controller = DisciplinaController();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    widget.controller.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Dashboard',
      appBarLeadingIcon: Icon(Icons.home),
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: widget.controller.listDisciplina.length,
              itemBuilder: (_, index) {
                var list = widget.controller.listDisciplina;
                Disciplina disciplina = list[index];
                return CardDisciplina(disciplina);
              });
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
