import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_for_4_may/pages/homepage.dart';
import 'package:task_for_4_may/pages/login_page.dart';
import 'package:task_for_4_may/pages/page_scroll.dart';

class SignUp extends StatefulWidget {
  static const String id = 'signup';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String firstname, lastname, email, password, confirmpassword;
  bool forShowHide = true;
  bool check = true;
  final formKey = GlobalKey<FormState>();

  forSignIn() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      setState(() {
        check = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, PageScroll.id);
                  },
                  icon: Icon(Icons.arrow_back)),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 25,
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff05007B),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                ' Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 25),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff339AFF),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                '  Twitter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text(
                      'dvrf frgf efefef',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 45, right: 45),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(171, 171, 171, 0.5),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: check?'Firstname':null,
                    ),
                    validator: (input) => !input!.isNotEmpty
                        ? "Please enter a your firstname"
                        : null,
                    onSaved: (input) => firstname = input!,
                  ),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 45, right: 45),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(171, 171, 171, 0.5),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: check?'Lastname':null,
                    ),
                    validator: (input) => !input!.isNotEmpty
                        ? "Please enter a your lastname"
                        : null,
                    onSaved: (input) => lastname = input!,
                  ),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 45, right: 45),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(171, 171, 171, 0.5),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: check?'Your Email':null,
                    ),
                    validator: (input) => !input!.contains('@')
                        ? "Please enter a valid email"
                        : null,
                    onSaved: (input) => email = input!,
                  ),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 45, right: 45),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(171, 171, 171, 0.5),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top:2),
                  child: TextFormField(
                    obscureText: forShowHide,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              forShowHide = !forShowHide;
                            });
                          },
                          icon: forShowHide == true
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.visibility_off)),
                      labelText: check?'Password':null,
                      border: InputBorder.none,
                    ),
                    validator: (input) => input!.length < 6
                        ? "Must be at least 6 character"
                        : null,
                    onSaved: (input) => confirmpassword = input!,
                  ),
                )),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  forSignIn();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 45, right: 45),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xff23A790),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Do you have an account?',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginPage.id);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Color(0xff23A790),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
