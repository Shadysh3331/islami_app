import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier{
  List<String> verses=[];

  loadSurahFiles(int index)async{
    String surah= await rootBundle.loadString("assets/files/${index+1}.txt");
    List<String> lines=surah.split("\n");
    verses=lines;
    notifyListeners();
  }
}