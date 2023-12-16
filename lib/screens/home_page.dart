import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_manager_uee_project_2022/screens/body-weight-tracker/body_weight_tracker_home.dart';
import 'package:health_manager_uee_project_2022/screens/diet-plan/diet_plan_home.dart';
import 'package:health_manager_uee_project_2022/screens/health-hotline/health_hotline_home.dart';
import 'package:health_manager_uee_project_2022/screens/healthy-recipe/healthy_recipe_home.dart';
import 'package:health_manager_uee_project_2022/screens/sleep-plan/sleep_plan_home.dart';
import 'package:health_manager_uee_project_2022/screens/symptoms-recorder/syptom_record_home.dart';
import 'package:health_manager_uee_project_2022/screens/water-drinking-plan/water_drink_home.dart';
import 'package:health_manager_uee_project_2022/screens/work-out-plan/work_out_home.dart';
import 'bmi-calculator/bmi_home.dart';
import 'daily-meal-plan/daily_meal_plan_home.dart';
import 'healthy-recipe/Screens/home/home.dart';
import 'healthy-recipe/components/bottom_nav.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
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
      body:
      Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisSize:MainAxisSize.max,
        children: [
          Container(
            margin:EdgeInsets.all(0),
            padding:EdgeInsets.all(0),
            width:MediaQuery.of(context).size.width,
            height:16,
            child:
            Padding(
              padding:EdgeInsets.fromLTRB(16, 50, 16, 16),
              child:
              Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children: [
                  Padding(
                    padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
                  ),
                ],),),
          ),
          Expanded(
            flex: 1,
            child:
            GridView(
              padding:EdgeInsets.all(16),
              shrinkWrap:true,
              scrollDirection:Axis.vertical,
              physics:ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing:16,
                mainAxisSpacing:0,
                childAspectRatio:0.55,
              ),
              children:[
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:100,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [
                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToDietPlanHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://i.pinimg.com/originals/62/af/5a/62af5a1e051a717365fcc094e92c9240.jpg"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Diet Plan",
                                textAlign: TextAlign.start,
                                maxLines:1,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],),),),
                    ],),
                ),
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToDailyMealPlanHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO_8VWbK3rJT2Ni0KiiOv8X8Py3-ET9EPm0iwMHuYXEW0uetCGBBc_oGUQg2nr5MOR_EQ&usqp=CAU"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Daily Meal Plan",
                                textAlign: TextAlign.start,
                                maxLines:1,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisSize:MainAxisSize.min,
                                children:[
                                ],),
                            ],),),),
                    ],),
                ),
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToBodyWeightTrackerHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://a0.anyrgb.com/pngimg/1318/1900/human-body-weight-balans-measuring-scales-justice-measurement-weight-human-body-map-diagram-red.png"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Body Weight Tracker",
                                textAlign: TextAlign.start,
                                maxLines:1,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisSize:MainAxisSize.min,
                                children:[
                                ],),
                            ],),),),
                    ],),
                ),
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToBMIHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://play-lh.googleusercontent.com/nbUQreHRdGBgODaR7IPnfbYvUHkf1EsOYOCgAPJFZZhB2fGmAT_NHgbIz_msPD-panU"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "BMI Calculator",
                                textAlign: TextAlign.start,
                                maxLines:1,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisSize:MainAxisSize.min,
                                children:[
                                  Padding(
                                    padding:EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  ),
                                ],),
                            ],),),),
                    ],),
                ),
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToHealthRecipeHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://healthyrecipesblogs.com/wp-content/uploads/2020/12/healthy-recipes-blog-logo-1200.jpg"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Healthy Recipe",
                                textAlign: TextAlign.start,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],),),),
                    ],),
                ),
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [
                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateSleepPlanHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://amerisleep.com/blog/wp-content/uploads/2020/03/sleep-calculator-scaled.jpg"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Sleep Plan",
                                textAlign: TextAlign.start,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],),),),
                    ],),
                ),
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToWaterDrinkingPlanHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://www.pinclipart.com/picdir/big/460-4608436_long-term-use-of-ionized-alkaline-water-is.png"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Water Drinking Plan",
                                textAlign: TextAlign.start,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],),),),
                    ],),
                ),



                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToWorkOutPlanHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://thumbs.dreamstime.com/b/holding-dumbbell-business-name-logo-design-template-black-dumbbell-hand-wearing-red-glove-holding-dumbbell-business-172910318.jpg"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Work Out Plan",
                                textAlign: TextAlign.start,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],),),),
                    ],),
                ),


                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToSymptomRecordHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://www.bannerhealth.com/-/media/images/project/healthcareblog/hero-images/2022/03/signs-of-severe-brain-injury-from-bumping-head.ashx?h=780&w=1170&hash=7EF60D33323D67A79535EF7F84CBDFC6"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Symptom Record",
                                textAlign: TextAlign.start,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],),),),
                    ],),
                ),
                Container(
                  margin:EdgeInsets.all(0),
                  padding:EdgeInsets.all(0),
                  width:200,
                  height:100,
                  decoration: BoxDecoration(
                    color:Color(0xffffffff),
                    shape:BoxShape.rectangle,
                    borderRadius:BorderRadius.zero,
                  ),
                  child:

                  Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children: [

                      Stack(
                        alignment:Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToHealthHotlineHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image:NetworkImage("https://www.sfusd.edu/sites/default/files/inline-images/CRISIS%20HOTLINE_0.png"),
                              height:MediaQuery.of(context).size.height * 0.2,
                              width:MediaQuery.of(context).size.width,
                              fit:BoxFit.cover,
                            ),
                          )
                        ],),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            mainAxisSize:MainAxisSize.max,
                            children: [
                              Text(
                                "Health Hotline",
                                textAlign: TextAlign.start,
                                overflow:TextOverflow.clip,
                                style:TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontStyle:FontStyle.normal,
                                  fontSize:14,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],),),),
                    ],),
                ),
              ],
            ),
          ),
        ],),
    );
  }
  void _navigateToDietPlanHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DietSplash()));
  }

  void _navigateToDailyMealPlanHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MealSplash()));
  }

  void _navigateToBodyWeightTrackerHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BWTSplash()));
  }

  void _navigateToBMIHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BMISplash()));
  }

  void _navigateToHealthRecipeHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HealthyRecipeSplash()));
  }

  void _navigateSleepPlanHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SleepPlanHOME()));
  }

  void _navigateToWaterDrinkingPlanHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WaterSplash()));
  }

  void _navigateToWorkOutPlanHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WorkOutSplash()));
  }

  void _navigateToSymptomRecordHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SyptomSplash()));
  }

  void _navigateToHealthHotlineHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HotlineSplash()));
  }
}


