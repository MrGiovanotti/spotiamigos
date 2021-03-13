import 'package:flutter/material.dart';
import 'package:spotiamigos/utils/RoutesUtils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Spotiamigos'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, RoutesUtils.CONFIG);
              },
            )
          ],
        ),
        body: Center(
          child: Text('Hola'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesUtils.ADD_FRIEND);
          },
          child: Icon(Icons.person_add),
        ),
      ),
    );
  }
}
