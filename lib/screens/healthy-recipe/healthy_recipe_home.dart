import 'package:flutter/material.dart';

class HealthRecipeHOME extends StatefulWidget {
  const HealthRecipeHOME({super.key});

  @override
  State<HealthRecipeHOME> createState() => _HealthRecipeHOMEState();
}

class _HealthRecipeHOMEState extends State<HealthRecipeHOME> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Health Manager"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Healthy Recipe Home",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
    );
  }
}
