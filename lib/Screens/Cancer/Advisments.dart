import 'package:flutter/material.dart';
import 'package:help_code/Screens/Cubit/DMC_cubit.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
class Advisment extends StatelessWidget {
  const Advisment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    var phon_width=screenSize.size.width;
    return SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Image.asset(
    'assets/images/oral-cancer1-removebg-preview.png',
    fit: BoxFit.cover,
    ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
              width: phon_width,
              child: Text('If you notice any changes in your mout300 '
                'or throat, such as sores, lumps, or red or '
                'white patches, Make Detection in our App'
                ' then if u has oral cancer signs '
                'Vist nearst ',
              style: TextStyle(fontSize: 17,color: Colors.black),maxLines: 5,overflow: TextOverflow.ellipsis,),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(' \n oral cancer specialist by ',
                  style: TextStyle(fontSize: 17,color: Colors.black),maxLines: 5,overflow: TextOverflow.ellipsis,),),
                TextButton(
                    onPressed: ()async{
                      await FlutterWebBrowser.openWebPage(url:"https://www.medifind.com/conditions/oral-cancer/1536/doctors");

                    },
                    child: Container(child: Text(' click Here',
                      style: TextStyle(fontSize: 17,color: Colors.pink),),)),
              ],
            ),

          ],
        ),
      ),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
    'Tips for Oral Cancer Prevention',
    style: TextStyle(
    fontSize: 23.0,
    color: Colors.pink,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ListTile(
    leading: Icon(Icons.smoke_free_rounded),
    title: Text('Avoid tobacco products'),
    ),
    ListTile(
    leading: Icon(Icons.no_drinks),
    title: Text('Limit alcohol consumption'),
    ),
    ListTile(
    leading: Icon(Icons.sunny),
    title: Text('Protect your lips from sun damage'),
    ),
    ListTile(
    leading: Icon(Icons.account_balance_wallet_sharp),
    title: Text('Maintain good oral hygiene'),
    ),
    ListTile(
    leading: Icon(Icons.search),
    title: Text('Get regular dental checkups'),
    ),

    ],
    ),);



  }
}
