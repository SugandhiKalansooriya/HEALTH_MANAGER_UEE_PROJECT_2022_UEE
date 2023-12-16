import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../healthy-recipe/components/bottom_nav.dart';


class WORKHOME extends StatefulWidget {
  const WORKHOME({super.key});

  @override
  State<WORKHOME> createState() => _WORKHOMEState();
}

class _WORKHOMEState extends State<WORKHOME> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _pnumberController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  final CollectionReference _workout =
  FirebaseFirestore.instance.collection('workout');


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
                bottom: MediaQuery
                    .of(ctx)
                    .viewInsets
                    .bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
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
                  controller: _weightController,
                  decoration: const InputDecoration(labelText: 'Weight'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
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

                    final double? pnumber =
                    double.tryParse(_pnumberController.text);
                    final String weight = _weightController.text;
                    final String date = _dateController.text;
                    final String description = _descriptionController.text;

                    if (pnumber != null) {
                      await _workout.add(
                          {
                            "name": name,
                            "pnumber": pnumber,
                            "weight": weight,
                            "date": date,
                            "description": description,
                          });

                      _nameController.text = '';
                      _pnumberController.text = '';
                      _weightController.text = '';
                      _dateController.text = '';
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

      _pnumberController.text = documentSnapshot['pnumber'].toString();
      _weightController.text = documentSnapshot['weight'];
      _dateController.text = documentSnapshot['date'];
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
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _pnumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                TextField(
                  controller: _weightController,
                  decoration: const InputDecoration(labelText: 'Weight'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String name = _nameController.text;

                    final double? pnumber =
                    double.tryParse(_pnumberController.text);
                    final String weight = _weightController.text;
                    final String date = _dateController.text;
                    final String description = _descriptionController.text;
                    if (pnumber != null) {

                      await _workout
                          .doc(documentSnapshot!.id)
                          .update(
                          {"name": name,

                            "pnumber": pnumber,
                            "weight": weight,
                            "date": date,
                            "description": description,}
                      );

                      _nameController.text = '';

                      _pnumberController.text = '';
                      _weightController.text = '';
                      _dateController.text = '';
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
    await _workout.doc(hotlineId).delete()
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
        // appBar: AppBar(
        //   title: const Center(child: Text('Daily Workout Progress')),//app header
        // ),
        bottomNavigationBar: BottomNavBar(),

        body: StreamBuilder(
          stream: _workout.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot)

          {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

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
                        documentSnapshot['weight'].toString(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}





