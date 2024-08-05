import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';
import '../bottom_sheets/language_bottomsheet.dart';
import '../bottom_sheets/theme_bottomsheets.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    String themeText = provider.mode == ThemeMode.light ? "light".tr() : "dark".tr();
    String languageText = context.locale == Locale("ar") ? "arabic".tr() : "english".tr();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("theme".tr()),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                backgroundColor: Colors.white,
                builder: (context) {
                  return ThemeBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Text(themeText),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Text("language".tr()),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Text(languageText),
            ),
          )
        ],
      ),
    );
  }
}
