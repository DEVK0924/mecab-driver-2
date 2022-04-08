import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mecab_driver/authentication/login_screen.dart';
import 'package:mecab_driver/authentication/signup_screen.dart';



class WelcomeScreen extends StatefulWidget
{
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ListView(
            children: [
              const SizedBox(height: 50,),
              const Text(
                "MeCab",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50,),
          CarouselSlider(
          items: [
            //1st Image of Slider
             Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1612867754336-c45d074c4f8e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //2nd Image of Slider
             Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1465925508512-1e7052bb62e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
            fit: BoxFit.cover,
               ),
              ),
             ),
           ],

            //Slider Container properties
            options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
              ),
             ),

              const SizedBox(height: 220,),
              const Text(
                "Welcome To the Driver App",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30,),

              ElevatedButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUpScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
