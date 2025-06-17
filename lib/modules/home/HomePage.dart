
import 'package:demo/modules/home/view/HomeView.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loc.title_home),
      // ),
      body: HomeView()
    );
  }
}