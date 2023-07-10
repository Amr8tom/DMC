import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:help_code/Screens/Cubit/states.dart';
import '../RandomScreens/Archived.dart';
import '../RandomScreens/Done.dart';
import '../RandomScreens/Tasks.dart';
class ToDocoubit extends Cubit<states>
{

  var Screens=[tasks(),done(),archived(),];
  ToDocoubit() : super(initState());
  void incrementCounter() {
    counter++;
    emit(incrementstate());
  }
  static ToDocoubit get(context) => BlocProvider.of(context);
  int switcher=0;
  int counter=0;
  void change_switcher (index){
    switcher=index;
    emit(decrementstate());
  }
  Widget cangegeListindex (){
    return Screens[switcher];
  }
  var KeyForm = GlobalKey<FormState>();
  void validator(){
    emit(decrementstate());
  }
}