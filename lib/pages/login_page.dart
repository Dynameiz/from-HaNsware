import 'package:flutter/material.dart';
import 'package:from_hansware/components/button.dart';
import 'package:from_hansware/components/credit.dart';
import 'package:from_hansware/components/password_field.dart';
import 'package:from_hansware/components/text_field.dart';
import 'package:from_hansware/pages/admin_page.dart';
import 'package:from_hansware/pages/main_page.dart';
import 'package:from_hansware/pages/register_page.dart';
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

    //Temporary Admin Login
    if(usernameTF.getText().compareTo('admin') == 0 && passwordTF.textController.text.compareTo('admin') == 0){
      Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return const AdminPage();
        },
      ));
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
                    Text("Ah, welcome back, Tarnished!\nIt's good to see you again.", textAlign: TextAlign.center, style: GoogleFonts.mulish(),),

                    const SizedBox(height: 30,),
                    usernameTF,
                    const SizedBox(height: 10,),
                    passwordTF,

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

                    const SizedBox(height: 20,),
                    MyButton(onTap: handleLogin, btnText: "Sign In",),

                    const SizedBox(height: 10,),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context){
                                  return const RegisterPage();
                                },
                              ));
                            },
                            child: const Text(
                            "Sign Up",
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