import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../healthy-recipe/components/bottom_nav.dart';
import 'bmi-calculation.dart';
import 'bmi-result.dart';
import 'dart:io';

enum Gender{
  male,
  female,
}

class BMIHOME extends StatefulWidget {
  const BMIHOME({super.key});

  @override
  State<BMIHOME> createState() => _BMIHOMEState();
}

class _BMIHOMEState extends State<BMIHOME> {

  Color inactiveColor = Color(0xFF24232F);
  Color activeColor = Colors.blueGrey;
  int height = 180;
  int weight = 30;
  int age = 15;
  Gender? selectedGender;

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
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color:selectedGender == Gender.male?activeColor:inactiveColor
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.male,
                            color: Colors.white,
                            size: 45.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("male",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                      color:selectedGender == Gender.female?activeColor:inactiveColor
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.female,
                        color: Colors.white,
                        size: 45.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("female",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: inactiveColor
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Height",
                      style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.baseline,
                      mainAxisAlignment:  MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SliderTheme(data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x291DE9B6),
                      inactiveTrackColor:  Colors.grey,
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 16.0
                      ),
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0
                      ),
                      thumbColor: Color(0xFF1DE9B6),
                    ), child: Slider(
                      value: height.toDouble(),
                      min:100.0,
                      max:250.0,
                      onChanged: (double v){
                        setState(() {
                          height = v.round();
                        });
                      },
                    ),
                    )
                  ],
                ),
              ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: inactiveColor
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if(weight > 10) {
                                          weight--;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: inactiveColor
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                              style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blueGrey,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blueGrey,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(age > 5) {
                                        age--;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),

          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 0, 1, 87),
              ),
              padding: EdgeInsets.only(bottom: 10.0),
              margin: EdgeInsets.only(bottom:25.0),
              width: 280,
              height: 51.0,
              // color: Color.fromARGB(255, 0, 1, 87),
              child: Center(
                child: Text(
                  "Calculate",
                    style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
            onTap: (){
              navigateToBMIresultScreen();
            },
          ),
        ],
      ),
    );
  }
  
  void navigateToBMIresultScreen(){
    CalResult obj = CalResult(weight, height);
    Navigator.push(context,MaterialPageRoute(builder: (context) => BMIResult(obj.calResult(), obj.msg, obj.getDescription())));
  }
}

//BMI Splash Screen
class BMISplash extends StatefulWidget {
  const BMISplash({Key? key}) : super(key: key);

  @override
  State<BMISplash> createState() => _BMISplashState();
}

class _BMISplashState extends State<BMISplash> {
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BMIHOME()));
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

