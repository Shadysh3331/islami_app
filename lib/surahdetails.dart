import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/provider/suradetails_provider.dart';
import 'package:islami_app/surahmodel.dart';
import 'package:provider/provider.dart';

class SurahDetails extends StatelessWidget {
  static const String routName="suarh";
  SurahDetails({super.key});


  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as SurahModel;
     var provider=Provider.of<MyProvider>(context);
    // if(provider.verses.isEmpty){
    //   provider.loadSurahFiles(model.index);
    // }
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadSurahFiles(model.index),
      builder: (context, child) =>Stack(children: [
        Image.asset(
        provider.mode==ThemeMode.light?
        "assets/images/main_bg.png":
          "assets/images/dark_bg.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
      appBar: AppBar(
      title: Text(
        model.name,
      ),
      ),
      body: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Colors.transparent
          )
        ),
        margin: EdgeInsets.all(12),
        color: provider.mode==ThemeMode.light?MyThemeData.whiteColor:
        MyThemeData.primaryDarkColor,
        child: ListView.builder(itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Provider.of<SuraDetailsProvider>(context).verses[index],
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.labelSmall
            ),
          );
        },
          itemCount: Provider.of<SuraDetailsProvider>(context).verses.length,
        ),
      ),
      ),
      ]
      ),
    );
  }


}
