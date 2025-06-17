
import 'package:demo/modules/party/view/PartyView.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class PartyPage extends StatefulWidget {
  const PartyPage({super.key, required this.title});
  final String title;
  @override
  State<PartyPage> createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.nav_party),
      ),
      body: PartyView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}