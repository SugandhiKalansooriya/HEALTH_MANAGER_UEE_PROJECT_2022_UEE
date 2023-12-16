
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main.dart';
import '../healthy-recipe/components/bottom_nav.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:health_manager_uee_project_2022/screens/home_page.dart';
class HealthHotHOME extends StatefulWidget {
  const HealthHotHOME({super.key});

  @override
  State<HealthHotHOME> createState() => _HealthHotHOMEState();
}

class _HealthHotHOMEState extends State<HealthHotHOME> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pnumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final CollectionReference _hotline =
  FirebaseFirestore.instance.collection('hotline');

  //add data
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _pnumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _jobController,
                  decoration: const InputDecoration(labelText: 'Job'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String address = _addressController.text;
                    final double? pnumber =
                    double.tryParse(_pnumberController.text);
                    final String email = _emailController.text;
                    final String job = _jobController.text;
                    final String description = _descriptionController.text;

                    if (pnumber != null) {
                      await _hotline.add({
                        "name": name,
                        "address": address,
                        "pnumber": pnumber,
                        "email": email,
                        "job": job,
                        "description": description,
                      });

                      _nameController.text = '';
                      _addressController.text = '';
                      _pnumberController.text = '';
                      _emailController.text = '';
                      _jobController.text = '';
                      _descriptionController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });



}


  //update data
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _addressController.text = documentSnapshot['address'];
      _pnumberController.text = documentSnapshot['pnumber'].toString();
      _emailController.text = documentSnapshot['email'];
      _jobController.text = documentSnapshot['job'];
      _descriptionController.text = documentSnapshot['description'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _pnumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _jobController,
                  decoration: const InputDecoration(labelText: 'Job'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String address = _addressController.text;
                    final double? pnumber =
                    double.tryParse(_pnumberController.text);
                    final String email = _emailController.text;
                    final String job = _jobController.text;
                    final String description = _descriptionController.text;
                    if (pnumber != null) {
                      await _hotline.doc(documentSnapshot!.id).update({
                        "name": name,
                        "address": address,
                        "pnumber": pnumber,
                        "email": email,
                        "job": job,
                        "description": description,
                      });

                      _nameController.text = '';
                      _addressController.text = '';
                      _pnumberController.text = '';
                      _emailController.text = '';
                      _jobController.text = '';
                      _descriptionController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  //delete............
  Future<void> _delete(String hotlineId) async {
    await _hotline.doc(hotlineId).delete()
        .then((value) {
      Get.snackbar('Success', 'Successfully Deleted');
    });
    Navigator.pop(context);


  }

// view body wights
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
        body: StreamBuilder(
          stream: _hotline.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
                  return Card(
                    shadowColor: Colors.purpleAccent,
                    margin: const EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.9),
                    ),
                    child: ListTile(
                      title: Text(
                        documentSnapshot['name'].toString(),
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        documentSnapshot['pnumber'].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: SizedBox(
                        width: 130,
                        child: Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Color(0xFFFFA000),
                              ),
                              onPressed: () => _update(documentSnapshot),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Delete Confirmation Message
                                // set up the buttons
                                Widget cancelButton = TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );
                                Widget continueButton = TextButton(
                                  child: Text("Ok"),
                                  onPressed: () => _delete(documentSnapshot.id),
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
                            ),

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

// Add new
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
//Health Hotline Splash Screen
class HotlineSplash extends StatefulWidget {
  const HotlineSplash({Key? key}) : super(key: key);

  @override
  State<HotlineSplash> createState() => _HotlineSplashState();
}

class _HotlineSplashState extends State<HotlineSplash> {
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HealthHotHOME()));
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
