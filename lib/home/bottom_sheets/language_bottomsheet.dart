import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "arabic".tr(),
                    style:context.locale==Locale("ar")?
                    Theme.of(context).textTheme.bodyMedium?.copyWith(color: provider.mode == ThemeMode.dark
                        ? MyThemeData.yellowColor
                        : MyThemeData.primaryColor,):
                    Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyThemeData.blackColor),
                  ),
                  context.locale==Locale("ar")? Icon(
                    Icons.done,
                    size: 30,
                    color: provider.mode == ThemeMode.dark
                        ? MyThemeData.yellowColor
                        : MyThemeData.primaryColor,
                  ):
                  SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("english".tr(),
                    style:context.locale!=Locale("ar")?
                    Theme.of(context).textTheme.bodyMedium?.copyWith(color: provider.mode == ThemeMode.dark
                        ? MyThemeData.yellowColor
                        : MyThemeData.primaryColor,):
                    Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyThemeData.blackColor),
                  ),
                  context.locale==Locale("en")? Icon(
                    Icons.done,
                    size: 30,
                    color: provider.mode == ThemeMode.dark
                        ? MyThemeData.yellowColor
                        : MyThemeData.primaryColor,
                  ):
                      SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}