

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_manager_uee_project_2022/screens/home_page.dart';
import './thankYOU.dart';
import '../healthy-recipe/components/bottom_nav.dart';

class AGEHOME extends StatefulWidget {
  const AGEHOME({super.key});

  @override
  State<AGEHOME> createState() => _AGEHOMEState();
}

class _AGEHOMEState extends State<AGEHOME> {

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
          Padding(
            padding: EdgeInsets.fromLTRB(60, 40, 0, 0),
            child: Text(
              "What is your age ?",
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
          Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
            child: MaterialButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>THANKYOUHOME()),);},//............navegate link
              color: Color(0xffbc7ace),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "18 - 19",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 220,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
            child: MaterialButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>THANKYOUHOME()),);},//............navegate link
              color: Color(0xffb560d6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "20 - 29",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 220,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
            child: MaterialButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>THANKYOUHOME()),);},//............navegate link
              color: Color(0xffa960bd),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "30 - 39",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 220,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
            child: MaterialButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>THANKYOUHOME()),);},//............navegate link
              color: Color(0xff984ab1),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "40 - 49",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 220,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
            child: MaterialButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>THANKYOUHOME()),);},//............navegate link
              color: Color(0xffaa65ca),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "50 - 59",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 220,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(200, 20, 0, 0),
            child: MaterialButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()),);},//............navegate link
              color: Color(0xff80559a),
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
              minWidth: 20,
            ),
          ),
        ],
      ),
    );
  }
}




