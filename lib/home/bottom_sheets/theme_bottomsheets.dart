import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "light".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: pro.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.blackColor,
                    ),
                  ),
                  pro.mode == ThemeMode.light
                      ? Icon(
                    Icons.done,
                    size: 30,
                    color: MyThemeData.primaryColor,
                  )
                      : SizedBox(),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "dark".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: pro.mode == ThemeMode.dark
                          ? MyThemeData.yellowColor
                          : MyThemeData.blackColor,
                    ),
                  ),
                  pro.mode == ThemeMode.dark
                      ? Icon(
                    Icons.done,
                    size: 30,
                    color: MyThemeData.yellowColor,
                  )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
