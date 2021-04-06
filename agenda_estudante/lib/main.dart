import 'package:agenda_estudante/components/DefaultScaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Dashboard(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
        accentColor: Colors.blue,
      ),
    ),
  );
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Dashboard',
      appBarLeadingIcon: Icon(Icons.home),
      body: ListView(
        children: [
          Column(
            children: [
              CardDisciplina(
                titulo: 'Cálculo',
                periodo: '7º semestre',
                professor: 'Lúcia Maria da Silva',
                imagem: 'calculus.jpg',
              ),
              CardDisciplina(
                titulo: 'Cálculo',
                periodo: '7º semestre',
                professor: 'Lúcia Maria da Silva',
                imagem: 'calculus.jpg',
              ),
              CardDisciplina(
                titulo: 'Cálculo',
                periodo: '7º semestre',
                professor: 'Lúcia Maria da Silva',
                imagem: 'calculus.jpg',
              ),
              CardDisciplina(
                titulo: 'Cálculo',
                periodo: '7º semestre',
                professor: 'Lúcia Maria da Silva',
                imagem: 'calculus.jpg',
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      ),
      fabIcon: Icon(Icons.add),
      fabNavigation: () {},
    );
  }
}

class CardDisciplina extends StatelessWidget {
  final String titulo;
  final String periodo;
  final String professor;
  final String imagem;

  CardDisciplina({this.titulo, this.periodo, this.professor, this.imagem});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          margin: EdgeInsets.all(24),
          color: Colors.lightBlue,
          height: 180,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Text(titulo),
                    Text(periodo),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/$imagem',
                  semanticLabel: titulo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(professor),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}

class CardDisciplinaItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
