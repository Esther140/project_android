import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class signUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const signUp({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();


  void dispose (){
    email.dispose();
    password.dispose();
    confirm_password.dispose();

    super.dispose();
  }
  Future signUp()async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    }
  }
bool passwordConfirmed(){
    if(password.text.trim() == confirm_password.text.trim()){
      return true;
    }else{
      return false;
    }
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
                  TextFormField(
                    obscureText: true,
                    controller: confirm_password,
                    decoration: const InputDecoration(
                      labelText: " Confirm password",
                      icon: Icon(Icons.vpn_key),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password';
                      }
                      return 'error';
                    },
                  ),

                  ElevatedButton(
                    onPressed: () {
                     signUp();
                    },
                    child: const Text("Sign up"),
                  ),
                  InkWell(onTap: (){
                    widget.showLoginPage();
                  },child: const Text("signin"),)
                ],

              ),
            ),
          ),
        ));

  }
}
