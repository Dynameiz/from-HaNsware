import 'package:flutter/material.dart';
import 'package:from_hansware/components/button.dart';
import 'package:from_hansware/components/credit.dart';
import 'package:from_hansware/components/password_field.dart';
import 'package:from_hansware/components/text_field.dart';
import 'package:from_hansware/pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  MyTextField usernameTF = MyTextField(textHint: "Username / Email");
  MyPasswordField passwordTF = MyPasswordField(textHint: "Password");

  void handleLogin(){
    if(usernameTF.getText().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tarnished, who might you be?"))
      );
      return;
    }
    if(!passwordTF.isValid()){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Hmm, are you truly the Tarnished?"))
      );
      return;
    }

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return MainPage(username: usernameTF.getText());
      }
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 102, 70),
        title: const Text("HaNsware", style: TextStyle(color: Colors.white),),
      ),
      body: 
      SingleChildScrollView(
        child: SafeArea(
          child: Center(
              child: Column(
                  children: <Widget>[
                    // Logo
                    const SizedBox(height: 30,),
                    Image.asset("./assets/logo.png", fit: BoxFit.cover, width: 200.0,),

                    // Text
                    const SizedBox(height: 20,),
                    Text("Ah, welcome back, Tarnished!\nIt's good to see you again.", textAlign: TextAlign.center, style: GoogleFonts.mulish(),),

                    // Username Text Field
                    const SizedBox(height: 30,),
                    usernameTF,
                    // Password Text Field
                    const SizedBox(height: 10,),
                    passwordTF,

                    // Forgot Password
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    // Login Button
                    const SizedBox(height: 20,),
                    MyButton(onTap: handleLogin, btnText: "Login",),

                    // Sign Up
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.lightBlue)
                          ),
                        ],
                      ),
                    ),

                    // Footer
                    const SizedBox(height: 40.0,),
                    const MyCredit(),
                  ],
                ),
          )
        ),

      ),
    );
  }
}