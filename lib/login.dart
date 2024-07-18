import 'package:flutter/material.dart';
import 'package:from_hansware/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin(){
    String username = usernameController.text;
    String password = passwordController.text;

    if(username.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tarnished, who might you be?"))
      );
      return;
    }
    if(password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Hmm, are you truly the Tarnished?"))
      );
      return;
    }

    //Validate does the account exist or not
    //if(...){
    //
    //}

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const HomePage();
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HaNsware"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 48.0, right: 48.0),
        child: Form(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email / Username",
                  ),
                  controller: usernameController,
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Email / Username is Empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  controller: passwordController,
                  obscureText: true,
                  autocorrect: false,
                  validator: (String? value) {
                    if(value == null || value.isEmpty){
                      return "Password is Empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: ElevatedButton(
                  onPressed: handleLogin,
                  child: const Text("Login"),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}