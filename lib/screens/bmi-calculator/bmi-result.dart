import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../healthy-recipe/components/bottom_nav.dart';

class BMIResult extends StatefulWidget {
  String result;
  String msg;
  String des;
  BMIResult(this.result, this.msg, this.des);
  @override
  _BMIResultState createState() => _BMIResultState();
}

class _BMIResultState extends State<BMIResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F2E3A),
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
      body: Column
        (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded(
          //   flex:1,
          //   child: Text(
          //     "Result",
          //         style: TextStyle(
          //           fontSize: 28.0,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white
          //         ),
          //   ),
          // ),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xFF24232F),
                ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  widget.result,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 60.0,
                  ),
                ),
                Text(
                  widget.msg,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  widget.des,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                ],
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 38, 39, 215),
                  ),
                  padding: EdgeInsets.only(bottom: 10.0),
                  margin: EdgeInsets.only(bottom:25.0),
                  width: 280,
                  height: 51.0,
                  // color: Color.fromARGB(255, 0, 1, 87),
                  child: Center(
                    child: Text(
                      "Re-Calculate",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
          ),
        ],
      ),
    );
  }
}
