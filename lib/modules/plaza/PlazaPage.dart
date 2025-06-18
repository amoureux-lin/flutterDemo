
import 'package:demo/modules/plaza/view/PlazaView.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class PlazaPage extends StatefulWidget {
  const PlazaPage({super.key});
  @override
  State<PlazaPage> createState() => _PlazaPageState();
}

class _PlazaPageState extends State<PlazaPage> {

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loc.title_home),
      // ),
        body: PlazaView()
    );
  }
}