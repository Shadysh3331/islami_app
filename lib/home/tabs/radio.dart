import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/radio_bg.png"),
          SizedBox(height: 18,),
          Text("إذاعة القرآن الكريم"),
          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.skip_previous,size: 35,
                color: provider.mode==ThemeMode.light?
                MyThemeData.primaryColor:
                MyThemeData.yellowColor,
              ),
              Icon(Icons.play_arrow,size: 50,
                color: provider.mode==ThemeMode.light?
                MyThemeData.primaryColor:
                MyThemeData.yellowColor,
              ),
              Icon(Icons.skip_next,size: 35,
                color: provider.mode==ThemeMode.light?
                MyThemeData.primaryColor:
                MyThemeData.yellowColor,
              ),

            ],
          )
        ],
      ),
    );
  }
}
