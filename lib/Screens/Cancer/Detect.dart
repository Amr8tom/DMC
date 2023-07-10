import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
//import 'dart:ui';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
//import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
//import 'package:tflite_flutter/tflite_flutter.dart';
//import 'package:tflite/tflite.dart';
class MakeDetection extends StatefulWidget {
  const MakeDetection({Key? key}) : super(key: key);
  @override
  State<MakeDetection> createState() => _MakeDetectionState();
}
class _MakeDetectionState extends State<MakeDetection> {
  @override
 // void initState() {
    // TODO: implement initState
    //super.initState();
   // loadmodel();
  //}
  // Future loadmodel() async{
  //   //Tflite.close();
  //   String res;
  //   res = (await Tflite.loadModel(model:"D:\Apps\help_code\assets\model00.tflite"))!;
  //   print("the mode is model pro mooodel:  $res");
  // }
  var result_text_0="You has Oral cancer";
  var result_text_1="You Don't has Oral cancer";
  var result= "click to Detect";
  File? uploadedImage;
    var count=1;
    @override
    Widget build(BuildContext context) {
    // get screen Size of mobile in variable to handel the size overall any phone
    // then slice the width to 10 piseace and the same for hieght
    var screenSize = MediaQuery.of(context);
    var phon_width_pieces=screenSize.size.width/10;
    var phon_height_pieces=(screenSize.size.height)/10;
    // create instantance of image picker
    final ImagePicker _picker = ImagePicker();
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
    // Pick an image from gallery   -- H-Error not yet
    Center(
    child: TextButton(
    onPressed: ()async{
    print("dsad");
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      uploadedImage=File(pickedFile!.path);
    });
    },
    child:ListTile(
    leading: Icon(Icons.upload),
    title:Text("Upload it from ur gallery",
      style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 17,
      ),),
    )
    ),
    ),
    // take an image by Camera    -- H Error not yet
    Center(
    child: TextButton(
    onPressed: () async{
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      uploadedImage=File(pickedFile!.path);
    });
    },
    child:ListTile(
      leading: Icon(Icons.camera_alt_outlined),
      title:Text("Take it By Camera",
        style:TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 17),),
      )
    ),
    ),
    Center(child: TextButton(
        onPressed: ()async{
          await FlutterWebBrowser.openWebPage(
              url:"https://amr8tom-oral-api-dd-h1mb0b.streamlit.app/");

        },
        child: Container(child: Text(' Vist our main site to Detection',
          style: TextStyle(fontSize: 17,color: Colors.pink),),)),),

    SizedBox(height: phon_height_pieces/3,),
    // showing the image and the result of it
      Container(
      width: phon_width_pieces * 7,
      height: phon_height_pieces * 4,
      decoration: BoxDecoration(
      image: uploadedImage != null ? DecorationImage(image: FileImage(uploadedImage!)) : null,
      ),
      ),

    SizedBox(height: phon_height_pieces/3,),
    TextButton(onPressed: () async{
      final request=http.MultipartRequest("POST",Uri.parse("https://63df-45-98-67-83.ngrok-free.app/"));
      request.files.add(await http.MultipartFile('image',uploadedImage!.readAsBytes().asStream(),uploadedImage!.lengthSync(),
      filename: uploadedImage!.path.split('/').last));
      final myRequest=await request.send();
      await http.Response.fromStream(myRequest).then((value){if(value.statusCode==200){
        final resJson=jsonDecode(value.body);
        print("response here: $resJson");
        result = resJson["prediction"];
      }else {
        print("Error ${value.statusCode}");
      }}).then((value) => {  setState(() {
      })});

                  },
              child: Text("${ result}",
            style: TextStyle(color:Colors.pink,fontWeight: FontWeight.bold,fontSize: 23),))
          ,
        ],
      );
  }
}