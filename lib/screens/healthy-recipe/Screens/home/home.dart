import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Models/Item.dart';

import '../../components/bottom_nav.dart';
import '../../constants.dart';

import 'components/item_card.dart';

import 'components/search_bar.dart';
import 'dart:io';

class HomeScreenHR extends StatelessWidget {
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
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kDefaultPadding),
        child: SafeArea(
          // bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the Best\nHealth for You',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: kDefaultPadding),

              Text(
                'Recipes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 30),

              StaggeredGridView.countBuilder(
                 padding: EdgeInsets.all(2),
                 crossAxisCount: 2,
                 itemCount: demoItems.length,
                 crossAxisSpacing: 10,
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 mainAxisSpacing: 8,
                 itemBuilder: (context, index) {
                   return ItemCard(item: demoItems[index], index: index);
                 },
                 staggeredTileBuilder: (index) => StaggeredTile.fit(2),
               ),
            ],
          ),
        ),
      ),
    );
  }
}

//Healthy Recipe Splash Screen
class HealthyRecipeSplash extends StatefulWidget {
  const HealthyRecipeSplash({Key? key}) : super(key: key);

  @override
  State<HealthyRecipeSplash> createState() => _HealthyRecipeSplashState();
}

class _HealthyRecipeSplashState extends State<HealthyRecipeSplash> {
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreenHR()));
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

