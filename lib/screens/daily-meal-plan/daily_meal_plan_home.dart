import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_manager_uee_project_2022/screens/daily-meal-plan/daily_meal_plan_lunch.dart';
import 'daily_meal_plan_breakfast.dart';
import 'daily_meal_plan_dinner.dart';
import '../healthy-recipe/components/bottom_nav.dart';

class DMPHOME extends StatefulWidget {
  const DMPHOME({super.key});

  @override
  State<DMPHOME> createState() => _DMPHOMEState();
}

class _DMPHOMEState extends State<DMPHOME> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: IconButton(
            icon: SvgPicture.asset('assets/icons/back.svg'),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffc396e5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Health Manager",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            margin: EdgeInsets.all(4),
            color: Color(0xffffffff),
            shadowColor: Color(0xff000000),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(12.0),
                      GestureDetector(
                        onTap: () {
                          _navigateToBreakfast(context);
                        }, // Image tapped
                        child:
                        Image(
                          image: NetworkImage(
                              "https://images.everydayhealth.com/images/healthy-low-carb-breakfast-recipes-01-love-and-lemons-1440x810.jpg"),
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      //),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 155, 211),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0)),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Text(
                    "Breakfast",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(4),
            color: Color(0xffffffff),
            shadowColor: Color(0xff000000),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(12.0),
                      GestureDetector(
                        onTap: () {
                          _navigateToLunch(context);
                        },
                        child:
                        Image(
                          image: NetworkImage("https://static.toiimg.com/thumb/msid-66476758,width-800,height-600,resizemode-75,imgsize-1640939,pt-32,y_pad-40/66476758.jpg"),
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 155, 211),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0)),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Text(
                    "Lunch",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(4),
            color: Color(0xffffffff),
            shadowColor: Color(0xff000000),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(12.0),
                      GestureDetector(
                        onTap: () {
                          _navigateToDinner(context);
                        }, // Image tapped
                        child: Image(
                          image: NetworkImage("https://thumbs.dreamstime.com/z/thanksgiving-dinner-table-roasted-whole-chicken-turkey-green-beans-mashed-potatoes-cranberry-sauce-grilled-vegetables-156724085.jpg"),
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 155, 211),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0)),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),

                  child: Text(
                    "Dinner",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _navigateToBreakfast(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealBreakfast()));
  }
  void _navigateToLunch(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealLunch()));
  }
  void _navigateToDinner(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDinner()));
  }
}

//Meal Plan Splash Screen
class MealSplash extends StatefulWidget {
  const MealSplash({Key? key}) : super(key: key);

  @override
  State<MealSplash> createState() => _MealSplashState();
}

class _MealSplashState extends State<MealSplash> {
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DMPHOME()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc396e5),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/heart.png', height: 130,),
            const SizedBox(height: 30,),
            if(Platform.isIOS)
              const CupertinoActivityIndicator(
                radius: 15,
              )
            else
              const CircularProgressIndicator(
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}

