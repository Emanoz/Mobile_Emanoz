import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final Icon fabIcon;
  final Icon appBarLeadingIcon;
  final Function fabNavigation;

  DefaultScaffold(
      {this.appBarTitle,
      this.body,
      this.fabIcon,
      this.fabNavigation,
      this.appBarLeadingIcon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarLeadingIcon,
        title: Text(appBarTitle),
      ),
      body: body,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(28),
        child: FloatingActionButton(
          onPressed: fabNavigation,
          child: fabIcon,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
