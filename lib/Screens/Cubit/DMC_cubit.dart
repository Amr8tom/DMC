import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:help_code/Screens/Cubit/states.dart';
import '../Cancer/Detect.dart';
import '../Cancer/Doctors.dart';
import 'dart:collection';
import 'dart:convert';
import '../Cancer/Advisments.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class DMCcoubit extends Cubit<states>
{
  var screens=[MakeDetection(),Doctors(),Advisment()];
  var switcher=0;
  DMCcoubit() : super(initState());
  var mymarkers =HashSet<Marker>();
  static DMCcoubit get(context) => BlocProvider.of(context);
  void refresh(){
    emit(incrementstate());
  }
  void addMarkers(){
   // mymarkers.add(Marker(markerId: ("6"),position: ))
    mymarkers.add(Marker(markerId: MarkerId("1"),position: LatLng(30.024499006276578, 31.23608024884151),
      infoWindow: InfoWindow(
          title:'Oral_cancer Department',
          snippet:'our place contact us to more information 01011577033 : AMR ALAA'
      ),
      onTap: (){
        emit(decrementstate());
      }),);
    mymarkers.add(Marker(markerId: MarkerId("11"),position: LatLng(30.030964855000867, 31.231910257818964),
      infoWindow: InfoWindow(
          title:'الفصر العيني الفرنساوي',
          snippet:''
      ),
      onTap: (){
        emit(decrementstate());
      }),);
    mymarkers.add(Marker(markerId: MarkerId("2"),position: LatLng(30.060924336888373, 31.19876577899601),
        infoWindow: InfoWindow(),
        onTap: (){
          emit(decrementstate());
        }),);
    mymarkers.add(Marker(markerId: MarkerId("3"),position: LatLng(30.055782870419197, 31.20894923645883),
        infoWindow: InfoWindow(
            title:'Oral_cancer Department',
            snippet:''
        ),
        onTap: (){
        emit(decrementstate());
  }),);
  mymarkers.add(Marker(markerId: MarkerId("4"),position: LatLng(30.028156780513463, 31.236534082001356),
  infoWindow: InfoWindow(
            title:'مستشفي أطقال مصر ',
            snippet:''
        ),
        onTap: (){
          emit(decrementstate());
        }),);
  mymarkers.add(Marker(markerId: MarkerId("5"),position: LatLng(30.046129573197756, 31.235713362816398),
  infoWindow: InfoWindow(
            title:'Advocacy Cancer',
            snippet:'مستشار صحي '
        ),
        onTap: (){
          emit(decrementstate());
        }),);
  mymarkers.add(Marker(markerId: MarkerId("6"),position: LatLng(30.039219713052425, 31.207732558389612),
  infoWindow: InfoWindow(
            title:'مركز برسوم لعلاج الاورام والكشف المبكرأ د. محسن برسوم أ د. عماد محسن برسوم',
            snippet:' '
        ),
        onTap: (){
          emit(decrementstate());
        }),);
  mymarkers.add(Marker(markerId: MarkerId("7"),position: LatLng(30.024358166253315, 31.23768746863147),
  infoWindow: InfoWindow(
            title:'مستشفى سرطان الأطفال 57357',
            snippet:' '
        ),
        onTap: (){
          emit(decrementstate());
        }),);
  mymarkers.add(Marker(markerId: MarkerId("8"),position: LatLng(30.0146969659349, 31.228074431529),
  infoWindow: InfoWindow(
            title:'مستشفي اورام دار السلام',
            snippet:' '
        ),
        onTap: (){
          emit(decrementstate());
        }),);
  mymarkers.add(Marker(markerId: MarkerId("9"),position: LatLng(30.028801408955193, 31.23288344962387),
  infoWindow: InfoWindow(
            title:'مركز علاج الاورام مصر | Misr Oncology Center',
            snippet:' '
        ),
        onTap: (){
          emit(decrementstate());
        }),);


    emit(incrementstate());


  }
  void change_switcher (index){
    switcher=index;
    emit(decrementstate());
  }
  var KeyForm = GlobalKey<FormState>();
  void validator(){
    emit(incrementstate());
  }
}