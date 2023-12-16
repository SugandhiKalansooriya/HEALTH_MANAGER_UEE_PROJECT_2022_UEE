import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../healthy-recipe/components/bottom_nav.dart';

class SleepPlanHOME extends StatefulWidget {
  const SleepPlanHOME({super.key});

  @override
  State<SleepPlanHOME> createState() => _SleepPlanHOMEState();
}

class _SleepPlanHOMEState extends State<SleepPlanHOME> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          leading: IconButton(
              icon: SvgPicture.asset('assets/icons/back.svg'),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          elevation:4,
          centerTitle:false,
          automaticallyImplyLeading: false,
          backgroundColor:Color(0xffc396e5),
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.zero,
          ),
          title:Text(
            "Health Manager",
            style:TextStyle(
              fontWeight:FontWeight.w800,
              fontStyle:FontStyle.normal,
              fontSize:17,
              color:Color(0xffffffff),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sleep Plan Home",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
    );
  }
}
