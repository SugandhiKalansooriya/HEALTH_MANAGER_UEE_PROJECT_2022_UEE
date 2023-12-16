import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter_svg/svg.dart';
import '../healthy-recipe/components/bottom_nav.dart';

class WeightChart extends StatefulWidget {
   WeightChart({Key? key}) : super(key: key);

  @override
  State<WeightChart> createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  final streamChart = FirebaseFirestore.instance.collection('weights').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context){
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
      body:
      ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StreamBuilder(
              stream: streamChart,
              builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
                if(snapshot.hasError){
                  return const Text('Something Went Wrong');
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Text("Loading");
                }
                List listChart = snapshot.data!.docs.map((e){
                  return{
                    'domain':e.data()['date'],
                    'measure': e.data()['weight'],
                  };
                }).toList();
                return AspectRatio(
                    aspectRatio: 12 / 17,
                    child: DChartBar(
                      data:[
                        {
                          'id': 'Bar',
                          'data': listChart,
                        }
                        ],
                      axisLineColor: Colors.green,
                      barColor: (barData, index, id) => Colors.green,
                      showBarValue: true,
                    ),
                );
              }
          )
        ],
      ),
    );
  }
}