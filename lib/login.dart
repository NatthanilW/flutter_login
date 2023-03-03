// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future sign_in() async {
    String url = 'http://127.0.0.1/flutter_login_php/flutter_login/login.php';
    final respone = await http.post(Uri.parse(url), body: {
      'name': name.text,
      'password': pass.text,
    });
    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'login');
    } else {
      Navigator.pushNamed(context, 'home');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ยินดีต้อนรับ !',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
         
                  SizedBox(
                    height: 30,
                  ),
                  // Image.network(''),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                        validator: (val){
                        if(val !.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: name,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                         validator: (val){
                        if(val !.isEmpty){
                          return 'Empty';
                        }
                        return null;
                      },
                      controller: pass,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 82, 255, 59),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        //   bool  login = formKey.currentState!.validate();
                        // if(login){
                        // Navigator.pushNamed(context, 'home');

                        //   sign_in();
                        // }
                        if(name.text == 'ice' && pass.text == 'ice'){
                        Navigator.pushNamed(context, 'home');
                        }
                        else if(name.text == 'natthanil' && pass.text == '0958433261'){
                          Navigator.pushNamed(context, 'home');
                        }
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
Text(''),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF3F60A0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        
                        Navigator.pushNamed(context, 'register');
                        
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
