import 'package:agenda_estudante/components/default_text_styles.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final Icon fabIcon;
  final Icon appBarLeadingIcon;
  final Function fabNavigation;
  final bool hasFab;
  final List<Widget> fabActions;
  final bool hasLeading;

  DefaultScaffold(
      {this.appBarTitle = '',
      this.body,
      this.fabIcon,
      this.fabNavigation,
      this.appBarLeadingIcon,
      this.hasFab = true,
      this.fabActions,
      this.hasLeading = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: hasLeading == true
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 40,
                ),
                onPressed: () => Navigator.pop(context),
              )
            : appBarLeadingIcon,
        title: Text(
          appBarTitle,
          style: DefaultTextStyles.appbarStyle(),
        ),
        actions: fabActions,
      ),
      body: body,
      floatingActionButton: hasFab
          ? Padding(
              padding: const EdgeInsets.all(28),
              child: FloatingActionButton(
                onPressed: fabNavigation,
                child: fabIcon,
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
          : null,
    );
  }
}
