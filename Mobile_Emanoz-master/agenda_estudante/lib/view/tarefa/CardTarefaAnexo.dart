import 'package:flutter/material.dart';

import '../../components/DefaultScaffold.dart';

class CardTarefaAnexo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Anexos',
      hasFab: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            item(),
            item(),
            item(),
            item(),
            item(),
            item(),
          ],
        ),
      ),
    );
  }
}

Widget item() {
  return Image.asset(
    'assets/cao.jpg',
    //semanticLabel: disciplina.titulo,
    fit: BoxFit.cover,
    width: double.infinity,
  );
}
