import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mecab_driver/authentication/login_screen.dart';
import 'package:mecab_driver/global/global.dart';
import 'package:mecab_driver/splashScreen/splash_screen.dart';
import 'package:mecab_driver/widgets/progress_dialog.dart';



class CarInfoScreen extends StatefulWidget
{
  // get signup screen data and save in this variable
  final String firstname, lastname, phone, email, pass, city, refer;
  const CarInfoScreen(this.firstname, this.lastname, this.phone, this.email, this.pass, this.city, this.refer);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}



class _CarInfoScreenState extends State<CarInfoScreen> {

  GlobalKey<FormState> carFormKey = GlobalKey<FormState>();
  TextEditingController carModelEditingController = TextEditingController();
  TextEditingController carNumberEditingController = TextEditingController();
  TextEditingController carColorEditingController = TextEditingController();
  TextEditingController adharCardNumberEditingController = TextEditingController();
  TextEditingController panCardNumberEditingController = TextEditingController();

  List<String> carTypesList = ["uber-x", "uber-go", "bike", "truck", "auto", "pickup", "transport-auto", "other"];
  String? selectedVehicleType;

  saveDriverInfoNow() async
  {
    // details save in firebase
    final User? firebaseUser = (
        await fAuth.createUserWithEmailAndPassword(
          email: widget.email.trim(),
          password: widget.pass.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Alert(context: context, title: "Error", desc: msg.toString()).show();
          //Fluttertoast.showToast(msg: "Error:" + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
      {
        // driver Details save
        Map driverMap =
        {
          "id": firebaseUser.uid,
          "firstname": widget.firstname,
          "lastname": widget.lastname,
          "email": widget.email,
          "phone": widget.phone,
          "city": widget.city,
          "refer_code": widget.refer,
          "status": "1",
          "user_id": "",
        };

        DatabaseReference driverRef = FirebaseDatabase.instance.ref().child("drivers");
        driverRef.child(firebaseUser.uid).set(driverMap);
        currentFirebaseUser = firebaseUser;

        // Driver Car Details save
        Map driverCarInfoMap =
        {
          "car_model_number": carModelEditingController.text.trim(),
          "car_number": carNumberEditingController.text.trim(),
          "car_color": carColorEditingController.text.trim(),
          "van_type": selectedVehicleType,
          "adhar_card_number": adharCardNumberEditingController.text.trim(),
          "pan_card_number": panCardNumberEditingController.text.trim(),
          "user_id": firebaseUser.uid,
          "status": "1",
        };

        DatabaseReference driverCarRef = FirebaseDatabase.instance.ref().child("drivers");
        driverCarRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);

        // after success then show alert
        //Fluttertoast.showToast(msg: "Congratulation \n Account has been created successfully.");
        Navigator.pop(context);
        Alert(
          context: context,
          type: AlertType.success,
          title: "Congratulation",
          desc: "Your account has been created successfully, Please Login.",
          buttons: [
            DialogButton(
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen())),
            ),
          ],
        ).show();
        //Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      }
    else
      {
        Navigator.pop(context);
        Alert(context: context, title: "Something went wrong", desc: "Account has not been created.").show();
        //Fluttertoast.showToast(msg: "Account has not been created");
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: carFormKey,
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text(
                  "Let's start with creating your account for vehicle details",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50,),

                // vehicle model field start
                TextFormField(
                  controller: carModelEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "Car model number is required.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Car Model Number",
                    hintText: "Car Model Number",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),
                //End

                // vehicle Number field start
                TextFormField(
                  controller: carNumberEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "Car number is required.";
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Car Number",
                    hintText: "Car Number",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),
                //End

                // vehicle color field start
                TextFormField(
                  controller: carColorEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "Car color is required.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Car Color",
                    hintText: "Car Color",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),
                //End

                // vehicle type
                DropdownButtonFormField(
                  validator: (value)
                  {
                    if (value == null) {
                      return 'Select vehicle type is required';
                    }
                  },
                  iconSize: 60,
                  isExpanded: true,
                  dropdownColor: Colors.black,
                  hint: const Text(
                    "Select vehicle Type",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,

                    ),
                  ),
                  value: selectedVehicleType,
                  onChanged: (newValue)
                  {
                    setState(() {
                      selectedVehicleType = newValue.toString();
                    });
                  },
                  items: carTypesList.map((car){
                    return DropdownMenuItem(
                      child: Text(
                        car,
                        style: const TextStyle(color: Colors.grey,),
                      ),
                      value: car,
                    );
                  }).toList(),
                ),
                // End

                // Adhar card number field start
                TextFormField(
                  controller: adharCardNumberEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "Adhar number is required.";
                    } else if(value.length != 12){
                      return "Enter valid aadhaar number.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Adhar Card Number",
                    hintText: "Adhar Card Number",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),
                //End

                // Pan car nuber field start
                TextFormField(
                  controller: panCardNumberEditingController,
                  textCapitalization: TextCapitalization.characters,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "Pan number is required.";
                    } else if(value.length != 10){
                      return "Enter valid pan number.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Pan Card Number",
                    hintText: "Pan Card Number",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),
                //End


                // Button start
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: ()
                  {
                    if(carFormKey.currentState!.validate())
                    {
                      saveDriverInfoNow();
                      showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext c)
                              {
                                // Future.delayed(const Duration(seconds: 4), () {
                                //   Navigator.of(context).pop(true);
                                // });
                                return ProgressDialog(message: "Processing, Please wait...",);
                              }
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text(
                    "Save Now",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



