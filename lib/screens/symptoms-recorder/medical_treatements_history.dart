import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../healthy-recipe/components/bottom_nav.dart';


class TreatementHistory extends StatefulWidget {
  const TreatementHistory({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TreatementHistory> {

  double ui=0;
// text fields' controllers
  final TextEditingController _doctor_nameController = TextEditingController();
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String imgUrl="";
 String id="";
  final CollectionReference _DoctorTreatements =
  FirebaseFirestore.instance.collection('DoctorTreatements');


  Future<void> _view([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _doctor_nameController.text = documentSnapshot['doctor_name'];
      _noteController.text = documentSnapshot['note'];
      _DateController.text = documentSnapshot['date'].toString();
       imgUrl=documentSnapshot['image'].toString();
       id=documentSnapshot.id;
    }

    await showModalBottomSheet(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(20.0),


        ),
         backgroundColor: Color(0xFCF9E9FF),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {

          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Doctor Name  "+ ":" +_doctor_nameController.text,
                 style: TextStyle(
                   fontSize: 18
                 ),),

                const SizedBox(
                  height: 20,
                ),
                Text("Date         "+ ":" +_DateController.text,
                  style: TextStyle(
                      fontSize: 18
                  ),),

                const SizedBox(
                  height: 20,
                ),
                Text("Treatement Discription  "+ ":  " +_noteController.text,
                  style: TextStyle(
                      fontSize: 18
                  ),),

                const SizedBox(
                  height: 20,
                ),
               Padding(
              padding : EdgeInsets.symmetric(horizontal: 50),
              child :DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
                child: SizedBox(

                height: 300,
                width: 200,

                child: Image.network(imgUrl,
                    fit: BoxFit.cover) )
            ),
            ),


              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _DoctorTreatements.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a treatement recorde')));
  }

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
        body:
        StreamBuilder(

          stream: _DoctorTreatements.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xffc396e5)
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    clipBehavior: Clip.hardEdge,

                    child: ListTile(
                      title: Text(documentSnapshot['date'] ),

                      subtitle:  Text(documentSnapshot['doctor_name'] ),


                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [

                            IconButton(
                                 padding: EdgeInsets.symmetric(horizontal: 10 ),
                                icon: const Icon(Icons.arrow_drop_down_circle_outlined,
                                color: Colors.black,
                                size: 40,),
                                onPressed: () =>
                                    _view(documentSnapshot)),

                              // IconButton(
                              //     padding: EdgeInsets.symmetric(horizontal: 5 ),
                              //     icon: const Icon(Icons.delete_forever,
                              //       size: 40,),
                              //     onPressed: () =>
                              //         _delete(documentSnapshot.id)),
                            IconButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Delete Confirmation Message
                                // set up the buttons
                                Widget cancelButton = TextButton(
                                  child: Text("Cancel"),
                                  onPressed:  () {
                                    Navigator.pop(context);
                                  },
                                );
                                Widget continueButton = TextButton(
                                  child: Text("Ok"),
                                  onPressed: () =>  _delete(documentSnapshot.id).then((value) =>  Navigator.pop(context)),

                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("Health Manager"),
                                  content: Text("Are you sure want to delete?"),
                                  actions: [
                                    cancelButton,
                                    continueButton,
                                  ],
                                );
                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                            )


                          ],
                        ),
                      ),
                    ),

                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
// Add new product

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
