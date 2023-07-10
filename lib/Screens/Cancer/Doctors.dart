import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:help_code/Screens/Cubit/DMC_cubit.dart';
class Doctors extends StatelessWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        GoogleMap(initialCameraPosition: CameraPosition(
          target:LatLng(30.0571, 31.2357) ,zoom: 14),
          onMapCreated: (MapController){
          DMCcoubit.get(context).addMarkers();
          },
          markers: DMCcoubit.get(context).mymarkers,
          myLocationButtonEnabled: true,
          myLocationEnabled:true,
        ),
        Container(child: Text("DR / eng AMR Alaa Ali",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),)
      ]
    ) ;
    // return Container(
    //   child: Center(child: Text("Doctors list avaliable contact",style: TextStyle(fontWeight: FontWeight.bold,
    //   fontSize: 45),)),
    // );
  }
}
