import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import '../healthy-recipe/components/bottom_nav.dart';
import 'medical_treatements_history.dart';

class MedicalNote extends StatefulWidget{
  const MedicalNote ({Key? key}):super(key: key);

  @override
  _MedicalNoteState createState() =>_MedicalNoteState();

}

class _MedicalNoteState extends State<MedicalNote>{

  void _navigateToTreatementsHistory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TreatementHistory()));
  }

  File? myImage;

  TextEditingController drNameController =TextEditingController();
  TextEditingController noteController =TextEditingController();
  TextEditingController dateController=TextEditingController();



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
      body: Container(
      height: double.infinity,
      width: double.infinity,
      child :SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),


        child: Column(
          children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:  MaterialButton(
                    onPressed: () async {


                    },
                    color: Color(0xffc396e5),
                    elevation: 0,

                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Text(
                      "Treatements",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xff000000),
                    height: 40,
                    minWidth: 190,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:  MaterialButton(
                    onPressed: () async {

                      _navigateToTreatementsHistory(context);
                    },
                    color: Color(0xffb4b0b7),
                    elevation: 0,

                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Text(
                      "History",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xff000000),
                    height: 40,
                    minWidth: 190,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 15),
            child: Text("Write a Note",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 22,
                color: Colors.black,
              ),

            ),),
          const SizedBox(
            height: 10,
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 30),


            child: TextField(
              controller: drNameController,
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                color: Color(0xff000000),
              ),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                ),
                hintText: "Doctor Name",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xffb4b0b7),
                ),
                filled: true,

                fillColor: Color(0xfff2f2f3),
                isDense: false,
                contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              ),
            ),


            ),
          const SizedBox(
            height: 10,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 30),
              child:  TextField(
                controller: dateController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                  ),
                  hintText: "Date of Treatement",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Color(0xffb4b0b7),
                  ),
                  filled: true,

                  fillColor: Color(0xfff2f2f3),
                  isDense: false,
                  contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                ),

                onTap: ()async{
                  DateTime? pickedDate = await showDatePicker(


                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Color(0xffc396e5), // <-- SEE HERE
                            onPrimary: Colors.black87, // <-- SEE HERE
                            onSurface: Colors.black87, // <-- SEE HERE
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary:Colors.black87, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if(pickedDate != null ){
                    print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    print(formattedDate); //formatted date output using intl package =>  2022-07-04
                    //You can format date as per your need

                    setState(() {
                      dateController.text = formattedDate; //set foratted date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }
                },
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 30),

            child :TextField(
              controller: noteController,
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 3,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                color: Color(0xff000000),
              ),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xffc396e5), width: 1),
                ),
                hintText: "Note",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xffb4b0b7),
                ),
                filled: true,

                fillColor: Color(0xfff2f2f3),
                isDense: false,
                contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap:(){
                openBottomSheet();
              },
              child:  DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: Container(
                      height: 230,
                      width: 150,
                      color: Color(0xffefe4ef),
                      child: myImage==null
                          ? const Center(
                        child: Icon(
                          Icons.upload_file,
                          size: 50,
                        ),
                      )
                          :Image.file(
                        myImage!,
                        fit: BoxFit.cover,
                      )
                  )
              )
          ),
          const SizedBox(
            height: 30,
          ),

          Padding(
              padding : EdgeInsets.symmetric(horizontal: 70,),
              child:MaterialButton(
                  color: Color(0xffc396e5),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  height: 50,
                  onPressed: (){
                    uplodaFile();
                  },
                  child:Text("Upload")
              )
          )
        ],),
      ),
    )
    );
  }

  openBottomSheet(){
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8),

        ),
      ),
      width: double.infinity,
      height: 150,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [

        buildImageWidget(
            iconData:Icons.camera_alt,
            onPressed:(){
              getImage(ImageSource.camera);
            }
        ),
        buildImageWidget(
            iconData:Icons.image,
            onPressed:(){
              getImage(ImageSource.gallery);
            }
        )

      ],),
    )
    );
  }




  buildImageWidget({required IconData iconData, required Function onPressed}){
    return InkWell(
      onTap: ()=>onPressed(),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            iconData,
            size: 30,
          ),
        ),

      ),
    );
  }


  final ImagePicker _picker=ImagePicker();
  getImage(ImageSource source) async{
    final XFile? image =await _picker.pickImage(source: source);

    if(image!=null){
      myImage=File(image.path);
      // uplodaFile();
      setState(() {});
      Get.back();
    }
  }

  void uplodaFile()async{
    final file =myImage;
    final metaData =SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref =storageRef.child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask =ref.putFile(file!,metaData);

    uploadTask.snapshotEvents.listen((event) {
      switch(event.state){
        case TaskState.running :
          print("file is uplording");
          break;
        case TaskState.success:
          ref.getDownloadURL().then((value) =>
              storeEntry(value,drNameController.text, noteController.text, dateController.text)
          );
          break;
      }
    });
  }
  storeEntry(String imgUrl, String drname, String note ,String date){

    FirebaseFirestore.instance.collection('DoctorTreatements').add({
      'image':imgUrl,
      'doctor_name':drname,
      'note':note,
      'date':date
    }).then((value){
      Get.snackbar("Success", 'Data stored successfully');
    });
  }
}

