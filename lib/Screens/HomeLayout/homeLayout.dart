import 'package:flutter/material.dart';
import 'package:help_code/Screens/Cancer/Doctors.dart';
import 'package:help_code/Screens/Cancer/Advisments.dart';
import 'package:help_code/Screens/Cubit/DMC_cubit.dart';
import 'package:help_code/Screens/Cubit/states.dart';
import '../Cancer/Detect.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TheHome extends StatelessWidget {
  TheHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screens=[MakeDetection(),Doctors(),Advisment()];
    var counter=2;
    return BlocProvider(
      create:(BuildContext context) => DMCcoubit(),
      child: BlocConsumer<DMCcoubit,states>(
        listener: ( context, state){ },
        builder: ( context, state){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                SizedBox(width: 3.5),
                TextButton(onPressed: (){}, child:Icon(Icons.account_circle,size: 40,color: Color.fromRGBO(189, 32, 92, 1.0),)),
                Spacer(),
                TextButton(onPressed: (){}, child: Text("oral cancer",
                  style: TextStyle(color:Color.fromRGBO(189, 32, 92, 1.0),fontSize: 28,fontWeight: FontWeight.bold),)),
                Spacer(),
                TextButton(onPressed: (){}, child: Icon(color:Color.fromRGBO(189, 32, 92, 1.0),Icons.logout,size: 40,)),
                SizedBox(width: 3.5)
              ],
            ),
            body: Container(
              child: DMCcoubit.get(context).screens[DMCcoubit.get(context).switcher],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(217, 59, 120, 1.0),
              onTap: (index){DMCcoubit.get(context).change_switcher(index);},
              currentIndex:DMCcoubit.get(context).switcher,
              items:[
                BottomNavigationBarItem(icon: Icon(Icons.question_mark_outlined),label: "Make Detection"),
                BottomNavigationBarItem(icon: Icon(Icons.quick_contacts_dialer_rounded),label: "Doctors"),
                BottomNavigationBarItem(icon: Icon(Icons.location_history_outlined),label: "Advisment"),
              ],
            ),
          ); }
    ),
    );
  }
}
