import 'package:flutter/material.dart';

import '../Cubit/todocoubit.dart';
class tasks extends StatelessWidget {
  const tasks({super.key });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'tasks',
            ),
            Text(
              '${ToDocoubit.get(context).counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
