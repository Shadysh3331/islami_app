import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/hadethdetails.dart';
import 'package:islami_app/home/homescreen.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/provider/suradetails_provider.dart';
import 'package:islami_app/surahdetails.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyProvider()..getTheme(),
      ),

    ],
      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          saveLocale: true,// <-- change the path of the translation files
          child: MyApp())));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context)..getTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode:provider.mode,
      theme:MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute:HomeScreen.routName,
      routes: {
      HomeScreen.routName: (context)=> HomeScreen(),
        SurahDetails.routName:(context)=> SurahDetails(),
        HadethDetails.routName:(context)=> HadethDetails()
      },
    );
  }
}
