import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/Example/home.dart';
import 'package:project/Example/ordercheck.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysql1/mysql1.dart';
import 'package:project/cache.dart' as cache;

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const Login({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // get http => null;
  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
     email: email.text,
      password: password.text,
    );
    cache.employeeId= email.text;
  }


  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //  color:Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wall.jpg'),
          fit: BoxFit.cover,
        ),

        // borderRadius: BorderRadius.circular(10), color: Colors.indigo[200]
      ),

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/Ester.jpeg'),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: "Company ID",
                  icon: Icon(Icons.account_circle),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a Company Id name';
                  }
                  return 'error';
                },
              ),
              const SizedBox(
                height: 45,
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  labelText: "password",
                  icon: Icon(Icons.vpn_key),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password';
                  }
                  return 'error';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    InkWell(
                      onTap: () {},
                      child: const Text("forgot password?"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => listorder()));
                    },
                    child: const Text("Login As employee"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: const Text("Login As Matron"),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  widget.showRegisterPage();
                },
                child: const Text("signup"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
