import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/ahadeth.dart';
import 'package:islami_app/home/tabs/quran.dart';
import 'package:islami_app/home/tabs/radio.dart';
import 'package:islami_app/home/tabs/sebha.dart';
import 'package:islami_app/home/tabs/settings.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItems=0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Stack(children: [
      Image.asset(
        pro.mode==ThemeMode.light?
        "assets/images/main_bg.png":
        "assets/images/dark_bg.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "islami".tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItems,
          onTap: (value) {
            selectedItems=value;
            setState(() {

            });
          },
            items: [
              BottomNavigationBarItem(
                icon:ImageIcon(
                AssetImage("assets/images/radio.png")),label: ""),
              BottomNavigationBarItem(
                icon:ImageIcon(
                AssetImage("assets/images/sebha.png")),label: ""),
              BottomNavigationBarItem(
                icon:ImageIcon(
                AssetImage("assets/images/ahadeth.png")),label: ""),
              BottomNavigationBarItem(
                icon:ImageIcon(
                AssetImage("assets/images/quran.png")),label: ""),
              BottomNavigationBarItem(
                icon:Icon(Icons.settings),label: ""),
            ]
        ),
        body: tabs[selectedItems],
      ),
    ]);
  }
  List<Widget> tabs=[
    RadioTab(),
    SebhaTab(),
    AhadethTab(),
    QuranTab(),
    SettingsTab()
  ];
}
