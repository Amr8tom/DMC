import 'package:flutter/material.dart';
import 'package:help_code/Screens/Authentication/login_abdo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Authentication/login_abdo.dart';
// using here statless cuz this screen just for show information
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var onboardcontroller = PageController();
    // using mediaquery to Slice the mobile screen
    var SSize=MediaQuery.of(context);
    var h=SSize.size.height;
    var w=SSize.size.width;
    bool islast=false;
    // 3 lists to fill the content of on board scree
    var imgs=["assets/images/a-removebg-preview.png","assets/images/oral-cancer1-removebg-preview.png"
      ,"assets/images/download-removebg-preview.png"];
    var titles=["Welcome to  DMC App ","Mouth Cancer Detection","Supervised by DR hanaa"];
    var bodies=[" The main Idea of Doc App it is to { detect Mouth Cancer } { DMC } form Your home without going to Hospital \n"
      "Also you Can do some Anther Activites like contact a doctor who you prefer form doctor list \n"
        "Also you find more information which help you to defeat this disease",
      "Mouth cancer, also known as oral cancer, is where a tumour develops in a part of the mouth. It may be on the surface of the tongue, the inside of the cheeks, the roof of the mouth (palate), the lips or gums"
      ,
        "Department : bioinformatic \n ""Students :\n amr alaa ali ID 2019060 \n"
        " mona fakry salem  ID 20198107",
    ""];

    return  Scaffold(
      appBar: AppBar(
        actions: [
          // Skip button for navigate to login screen
          TextButton(onPressed: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => LoginScreen()));
          },
              child:Text("Skip     ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold ,color: Colors.blue),))
        ],
      ),
      body:
      // body Contain just a Column  which Contain 2 main elements item buidler and Indicator
      Column(
        children: [
          // Item builder to build the on board imgs $ and content by parsing in 3 lists imgs , titles and bodies
          Expanded(
            child: PageView.builder(itemBuilder: (context,index)=>Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(imgs[index],gaplessPlayback: false,),
                  SizedBox(
                    width:w/10,
                    height:h/15 ,
                  ),
                  Text(titles[index],style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold ,color: Colors.blue),),
                  SizedBox(
                    width:w/10,
                    height:h/15 ,
                  ),
                  Text(bodies[index]
                    ,maxLines: 4,overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17 ,color: Colors.white),),
                  Spacer(),
                ],
              ),
            ),
              controller: onboardcontroller,
              onPageChanged: (int index){
              if(index==imgs.length-1){
                islast=true;
              }else{
                islast=false;
              }
              },
              itemCount: imgs.length,),
          ),
          // Indicator to navigate to intro
          Row(children: [
            SmoothPageIndicator(controller: onboardcontroller,
                effect:ExpandingDotsEffect(
                  dotColor:Colors.grey,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5.0,
                ) ,
                count: imgs.length),
            Spacer(),
            FloatingActionButton(
                child: Icon(Icons.arrow_forward_ios),
                onPressed: (){
                  if(islast==true){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => LoginScreen()));
                  }else{
                  onboardcontroller.nextPage(duration: Duration(milliseconds: 500,),
                      curve: Curves.fastLinearToSlowEaseIn);}
                })
          ],)
        ],
      ),
    );
  }
}
