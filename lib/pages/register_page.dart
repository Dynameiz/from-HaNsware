import 'package:flutter/material.dart';
import 'package:from_hansware/components/button.dart';
import 'package:from_hansware/components/credit.dart';
import 'package:from_hansware/components/password_field.dart';
import 'package:from_hansware/components/text_field.dart';
import 'package:from_hansware/pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  MyTextField usernameTF = MyTextField(textHint: "Username");
  MyTextField emailTF = MyTextField(textHint: "Email");
  MyPasswordField passwordTF = MyPasswordField(textHint: "Password");

  void handleRegister(){
    if(usernameTF.getText().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tarnished, who might you be?"))
      );
      return;
    }
    if(usernameTF.getText().length < 4){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Hmm, Tarnished, your name should be at least 4 characters long."))
      );
      return;
    }
    if(usernameTF.getText().length > 12){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ah, Tarnished, your name is a bit lengthy. Twelve characters max."))
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
        title: Text("HaNsware", style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: 
      SingleChildScrollView(
        child: SafeArea(
          child: Center(
              child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30,),
                    Image.asset("./assets/logo.png", fit: BoxFit.cover, width: 200.0,),

                    const SizedBox(height: 20,),
                    Text("Ah, a new face! Welcome, Tarnished.", textAlign: TextAlign.center, style: GoogleFonts.mulish(),),

                    const SizedBox(height: 30,),
                    usernameTF,
                    const SizedBox(height: 10),
                    emailTF,
                    const SizedBox(height: 10,),
                    passwordTF,

                    const SizedBox(height: 20,),
                    MyButton(onTap: handleRegister, btnText: "Sign Up"),

                    const SizedBox(height: 10,),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.lightBlue)
                          ),
                          )
                        ],
                      ),
                    ),

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