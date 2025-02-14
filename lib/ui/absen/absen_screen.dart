import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AbsentScgit add .
reen extends StatefulWidget {
  const AbsentScreen({Key? key}) : super(key: key);

  @override
  State<AbsentScreen> createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('absent');
  final controllerName = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  String dropValueCategories = "Please Choose";
  var categoriesList = <String>["Please Choose", "Sick", "Permission", "Others"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Request Permission Menu",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10),
         ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                ),

                child: const Row(
                  children: [
                    SizedBox(width: 12,),
                    Icon(Icons.maps_home_work_outlined),
                    SizedBox(width: 12,),
                    Text("Please fiil out the form", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),)
                  ],
                ),

              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: TextField(
                  controller: controllerName,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Your Name",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                    ),
                    hintText: "Please enter your Name",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue)
                    )
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(10),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent, width: 1.0),
                  ),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                      value: dropValueCategories,
                      items: categoriesList.map((value){
                        return DropdownMenuItem(
                          value: value,
                            child: Text(value.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),)
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          dropValueCategories = value.toString();
                        });
                      },
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 14,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    underline: Container(
                      color: Colors.transparent,
                      height: 2,
                    ),
                    isExpanded: true,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            const Text("Form: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                            Expanded(
                                child: TextField(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      builder: (BuildContext context, Widget? child) {
                                        return Theme(
                                            data: Theme.of(context).copyWith(
                                              colorScheme: ColorScheme.light(
                                                onPrimary: Colors.white,
                                                onSurface: Colors.black,
                                                primary: Colors.blueAccent,
                                              ),
                                              datePickerTheme: DatePickerThemeData(
                                                headerBackgroundColor: Colors.blueAccent,
                                                backgroundColor: Colors.white
                                              )
                                            ),
                                            child: child!
                                        );
                                      },
                                        context: context,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(9999)
                                    );
                                    if(pickedDate != null)(
                                        fromController.text = DateFormat('dd/MM/yyyy').format(pickedDate)
                                    );
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  controller: fromController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    )
                                  ),
                                )
                            )
                          ],
                        ),
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            const Text(
                              "until: ",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                                child: TextField(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        builder: (BuildContext context, Widget? child) {
                                          return Theme(
                                              data: Theme.of(context).copyWith(
                                                  colorScheme: ColorScheme.light(
                                                    onPrimary: Colors.white,
                                                    onSurface: Colors.black,
                                                    primary: Colors.blueAccent,
                                                  ),
                                                  datePickerTheme: DatePickerThemeData(
                                                      headerBackgroundColor: Colors.blueAccent,
                                                      backgroundColor: Colors.white
                                                  )
                                              ),
                                              child: child!
                                          );
                                        },
                                        context: context,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(9999)
                                    );
                                    if(pickedDate != null)(
                                        toController.text = DateFormat('dd/MM/yyyy').format(pickedDate)
                                    );
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  controller: toController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      )
                                  ),
                                )
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(30),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                      child: InkWell(
                        splashColor: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          if (controllerName.text.isEmpty || dropValueCategories == "Please choose:" || fromController.text.isEmpty || toController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'Ups Please fill out the form',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.blueAccent,
                              shape: StadiumBorder(),
                              behavior: SnackBarBehavior.floating,
                            ));
                          }else{
                            submitAbsen(controllerName.text.toString(), dropValueCategories.toString(), fromController.text, toController.text);
                          }
                        },
                        child: Center(
                          child: Text("Make a request", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),

                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submitAbsen(
      String name, String reason, String form, String until) async {
    showLoaderDialog(context);
    dataCollection.add({
      'address' : '-',
      'name': name,
      'reason': reason,
      'until': '$form-$until',
    }).then((result) {
      setState(() {
        Navigator.of(context).pop();
        try {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'your data has been submitted succesfully',
                    style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            backgroundColor: Colors.blueGrey,
            shape: StadiumBorder(),
            behavior: SnackBarBehavior.floating,
          ));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                      'ups, something went wrong, Please try again later',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            backgroundColor: Colors.blueGrey,
            shape: StadiumBorder(),
            behavior: SnackBarBehavior.floating,
          ));
        }
      });
    });
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Row(
      children: [
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text("Checking the Data..."),
        )
      ],
    ));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
