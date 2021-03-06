import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isObscure1 = true;

  String _errorMessage = '';

  String email = "";
  String pass = "";
  String selectedValue;

  User u = new User();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
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
              )
          ),
          // color: Color(0xFFf5f0f1),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Welcome !',
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 30.0, 25.0, 10),
                          child: TextFormField(
                            cursorColor: Color(0xFFfdca01),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please your name';
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              u.name = value;
                            },
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                              hintText: ("Enter Name"),
                              hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),),
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 5.0, 25.0, 10),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {
                              setState(() {
                                u.email = val;
                              });
                            },
                            validator: (value) {
                              bool x = EmailValidator.validate(value, true);
                              if (value == null || value.isEmpty) {
                                return 'Email can not be empty';
                              } else if (x == false) {
                                return "Invalid Email address";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                              hintText: ("Enter Email"),
                              hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),),
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 5.0, 25.0, 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password should be at least 8 characters';
                              } else if (value.length > 20) {
                                return 'Password should be no more than 20 characters';
                              }
                              return null;
                            },
                            obscureText: _isObscure,
                            onChanged: (String value) {
                              pass = value;
                            },
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                              fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                              hintText: ("Enter Password"),
                              hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),),
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 5.0, 25.0, 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a confirm password';
                              } else if (value != pass) {
                                return 'Those passwords didn\'t match. Try again';
                              }
                              return null;
                            },
                            obscureText: _isObscure1,
                            onChanged: (String value) {
                              setState(() {
                                u.password = value;
                              });
                            },
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                              fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                              hintText: ("Confirm Password"),
                              hintStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFfdca01), width: 2),
                                borderRadius: BorderRadius.circular(20),),
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 5.0, 25.0, 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 160,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      hintText: ("Enter Gender"),
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFfdca01), width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder:OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Color(0xFFfdca01), width: 2),
                                        borderRadius: BorderRadius.circular(20),),
                                      filled: true,
                                    ),
                                    //dropdownColor: Colors.blueAccent,
                                    value: selectedValue,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please choose your gender';
                                      }
                                      return null;
                                    },
                                    onChanged: (String newValue) {
                                      setState(() {
                                        selectedValue = newValue;
                                        u.gender = selectedValue;
                                      });
                                    },
                                    items: dropdownItems),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  width: 160,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please choose your age';
                                      } else if (int.parse(value) < 10) {
                                        return 'You are too young to signup';
                                      }
                                      return null;
                                    },
                                    onChanged: (String value) {
                                      setState(() {
                                        u.age = int.parse(value);
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    textCapitalization:
                                        TextCapitalization.words,
                                    decoration: InputDecoration(
                                      fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      hintText: ("Enter Age"),
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFfdca01), width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder:OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Color(0xFFfdca01), width: 2),
                                        borderRadius: BorderRadius.circular(20),),
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            width: 320,
                            height: 50,
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
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Signup()));
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
                        ),
                        Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                            thickness: 4,
                            height: 100,
                                indent: 20,
                                endIndent: 8,
                          )),
                          Text("continue with",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),),
                          Expanded(
                              child: Divider(
                            thickness: 4,
                            height: 100,
                                indent: 8,
                                endIndent: 20,
                          )),
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //color: Colors.red,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent, width: 3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                child: Image.asset("assets/gmail.png"),
                                // Icon(
                                //     FontAwesomeIcons.google,
                                //     color: Colors.blue, size: 40.0),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                //color: Colors.red,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.transparent, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: SizedBox(
                                  child: Icon(FontAwesomeIcons.apple,
                                      color: Colors.blueGrey, size: 40.0),
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            Container(
                              //color: Colors.red,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent, width: 3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                child: Icon(FontAwesomeIcons.facebook,
                                    color: Colors.blue, size: 40.0),
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  String name;
  String email;
  String password;
  String gender;
  int age;

  User(
      {@required this.name,
      @required this.email,
      @required this.password,
      @required this.gender,
      @required this.age});
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Male"), value: "Male"),
    DropdownMenuItem(child: Text("Female"), value: "Female"),
  ];
  return menuItems;
}
