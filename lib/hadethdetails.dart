import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/hadethmodel.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routName="hadeth";
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as HadethModel;
    var provider=Provider.of<MyProvider>(context);
    return Stack(children: [
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
          title: Text(model.title,
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
              child: Text(model.content[index],
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.labelSmall
              ),
            );
          },
            itemCount: model.content.length,
          ),
        ),
      ),
    ]
    );
  }
}
