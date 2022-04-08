import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:mecab_driver/authentication/car_info_screen.dart';
import 'package:mecab_driver/authentication/login_screen.dart';



class SignUpScreen extends StatefulWidget
{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen>
{

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController referCodeEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                 const SizedBox(height: 50,),
               const Text(
                  "Let's start with creating your account in Driver App",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50,),
              // first field start
                TextFormField(
                  controller: firstNameEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "First name is required.";
                    }
                    else if(value.length < 3){
                      return "First name can't less 3 character";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    hintText: "First Name",
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

                // second field start
                TextFormField(
                  controller: lastNameEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "Last name is required.";
                    }
                    else if(value.length < 3){
                      return "Last name can't less 3 character";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                      color: Colors.grey
                  ),

                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    hintText: "Last Name",
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

                // third field start
                TextFormField(
                  controller: emailTextEditingController,
                  validator: (String? value)
                  {
                    String pattern =
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$";
                    RegExp regex = RegExp(pattern);
                    if(value!.isEmpty){
                      return "Email is required.";
                    } else if(!regex.hasMatch(value)){
                      return "Enter valid Email.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
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

                // mobile number field
                TextFormField(
                  controller: phoneTextEditingController,
                  validator: (String? value)
                  {
                    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = new RegExp(patttern);
                    if(value!.isEmpty){
                      return "Phone number is required.";
                    } else if(!regExp.hasMatch(value)){
                      return "Enter valid phone number.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Phone Number",
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

                // fourth field start
                TextFormField(
                  controller: passwordTextEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "Password is required.";
                    } else if(value.length < 6){
                      return "Requirement is minimum 6 letter Password or more.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
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

                // five field start
                TextFormField(
                  controller: cityTextEditingController,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){
                      return "City name is required.";
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.grey
                  ),

                  decoration: const InputDecoration(
                    labelText: "City",
                    hintText: "City",
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

                // six field start
                TextFormField(
                  controller: referCodeEditingController,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  decoration: const InputDecoration(
                    labelText: "Refer Code",
                    hintText: "Refer Code",
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

                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: ()
                  {
                    if(formkey.currentState!.validate())
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>
                          CarInfoScreen(firstNameEditingController.text, lastNameEditingController.text,
                              phoneTextEditingController.text, emailTextEditingController.text,
                              passwordTextEditingController.text, cityTextEditingController.text, referCodeEditingController.text)));
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ),

                TextButton(
                  child: const Text(
                    "You have already account? Login Here",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>
                        LoginScreen()
                      )
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

//validation form here

