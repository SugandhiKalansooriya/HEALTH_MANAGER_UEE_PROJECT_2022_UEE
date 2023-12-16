import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_manager_uee_project_2022/screens/home_page.dart';
import 'package:health_manager_uee_project_2022/screens/work-out-plan/workOUT.dart';

import '../healthy-recipe/components/bottom_nav.dart';

class THANKYOUHOME extends StatefulWidget {
  const THANKYOUHOME({super.key});

  @override
  State<THANKYOUHOME> createState() => _THANKYOUHOMEState();
}

class _THANKYOUHOMEState extends State<THANKYOUHOME> {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Color(0xffffffff),

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
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
  Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
  Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
  Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
  Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
  Padding(
  padding: EdgeInsets.fromLTRB(80, 40, 0, 0),
  child: Text(
  "Thank You  !",
  textAlign: TextAlign.start,
  overflow: TextOverflow.clip,
  style: TextStyle(
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  fontSize: 18,
  color: Color(0xff000000),
  ),
  ),
  ),
  ],
  ),
  ],
  ),
  ],
  ),
  ],
  ),
  Padding(
  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
  child:

  ///***If you have exported images you must have to copy those images in assets/images directory.
  Image(
  image: NetworkImage("https://cdn.cnn.com/cnnnext/dam/assets/220916130716-chris-hemsworth-fitness-app-centr-1-large-169.jpg"),
  height: 200,
  width: 230,
  fit: BoxFit.cover,
  ),
  ),
  Padding(
  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
  child: MaterialButton(
  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>WORKHOME()),);},//............navegate link
  color: Color(0xffbf94e4),
  elevation: 0,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.zero,
  side: BorderSide(color: Color(0xff808080), width: 1),
  ),
  padding: EdgeInsets.all(16),
  child: Text(
  "Lets Do It !",
  style: TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  ),
  ),
  textColor: Color(0xff000000),
  height: 40,
  minWidth: 240,
  ),
  ),
  Padding(
  padding: EdgeInsets.fromLTRB(180, 20, 0, 0),
  child: MaterialButton(
  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()),);},//............navegate link
  color: Color(0xff9b67b2),
  elevation: 0,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.zero,
  side: BorderSide(color: Color(0xff808080), width: 1),
  ),
  padding: EdgeInsets.all(16),
  child: Text(
  "Back",
  style: TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  ),
  ),
  textColor: Color(0xff000000),
  height: 40,
  minWidth: 25,
  ),
  ),
  ],
  ),
  );
  }
  }


