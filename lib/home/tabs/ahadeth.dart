import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/hadethdetails.dart';
import 'package:islami_app/hadethmodel.dart';

class AhadethTab extends StatefulWidget {
 AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth=[];

  @override
  Widget build(BuildContext context) {
    if(allAhadeth.isEmpty){
      loadHadethFiles();
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
       Image.asset("assets/images/ahadeth_bg.png",height: 219,),
          Divider(
            thickness: 3,
          ),
          Text("ahadeth".tr(),textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium
          ),
          Divider(
            thickness: 3,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
             return InkWell(
               onTap: () {
                 Navigator.pushNamed(context, HadethDetails.routName,
                 arguments: HadethModel(allAhadeth[index].title, allAhadeth[index].content)
                 );
               },
               child: Text(allAhadeth[index].title,textAlign: TextAlign.center,
                 style: Theme.of(context).textTheme.bodySmall,
               ),
             );
            },
              itemCount: allAhadeth.length,
            ),
          )
      ]
    )
    );
  }

  loadHadethFiles()async{
    String hadeth= await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> lines=hadeth.split("#");
    for(int i=0;i<lines.length;i++){
      String hadethone=lines[i];
      List<String> hadethLines=hadethone.trim().split("\n");
      String title=hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content=hadethLines;
      HadethModel hadethModel=HadethModel(title, content);
      allAhadeth.add(hadethModel);
    }
 setState(() {

});
  }
}
