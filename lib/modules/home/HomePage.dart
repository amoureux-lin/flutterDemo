
import 'package:demo/modules/home/view/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../core/utils/DeviceUtils.dart';
import '../../l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    super.initState();
    print("0000000000");
  }

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