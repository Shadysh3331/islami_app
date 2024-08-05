import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns=0;
  int counter=0;

  List<String>Azkar=[
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر"
  ];
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return
       Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 280),
                child: Image.asset(provider.mode==ThemeMode.light?"assets/images/head of seb7a.png":
                "assets/images/head of seb7a dark.png"
                ),
              ),
              AnimatedRotation(
                turns: turns,
                  duration: Duration(seconds: 1),
                  child: GestureDetector(
                    onTap: () {
                      turns+=1/33;
                      counter++;
                      setState(() {

                      });
                    },
                      child: Image.asset(provider.mode==ThemeMode.light?"assets/images/body of seb7a.png":
                        "assets/images/body of seb7a dark.png"
                      ),
                  ),
              )
            ],
          ),
          Text("عدد التسبيحات",
          textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium
          ),
          SizedBox(height: 14,),
          Container(
            decoration: BoxDecoration(
              color: provider.mode==ThemeMode.light? MyThemeData.primaryColor:
                MyThemeData.primaryDarkColor,
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 150),
            child: Text("$counter",textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall
            ),
          ),
          SizedBox(height: 22,),
          Container(
            decoration: BoxDecoration(
                color: provider.mode==ThemeMode.light? MyThemeData.primaryColor:
                MyThemeData.yellowColor,
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: Text(Azkar[(counter ~/ 33) % Azkar.length],textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.bodySmall?.copyWith(
                color: provider.mode==ThemeMode.light? MyThemeData.whiteColor:
                    MyThemeData.primaryDarkColor
              )
            ),
          )
        ],
      );
  }
}
