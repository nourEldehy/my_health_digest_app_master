import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_and_diet_app/ui/pages/signup.dart';
import 'package:training_and_diet_app/ui/pages/login.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          //color: Color.fromRGBO(53, 157, 232, 1),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              // Color.fromRGBO(255, 37, 87, 1),
              // Color.fromRGBO(255, 37, 87, 1),
              // Colors.black54,
              // Color.fromRGBO(255, 37, 87, 1),
              Colors.blue,
              //Colors.white70,
              // Color(0xFF380f90),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          )),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hello there! it's time to maintain your health",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/3D-Yellow.png"))),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    color: Color(0xFFfdca01),
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: "Angel",
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color(0xFFf5f0f1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          primary: Color.fromRGBO(255, 255, 255, 0.2),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 4,
                                color: Color(0xFFfdca01),
                              ),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: "Angel",
                            fontWeight: FontWeight.bold,
                            fontSize: 29,
                            color: Color(0xFFfdca01),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
