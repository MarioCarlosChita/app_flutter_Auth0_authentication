


import 'package:appauthentication/services/authentication_service.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget{  
    AuthenticationPageState createState ()=> AuthenticationPageState();
}
class AuthenticationPageState extends  State<AuthenticationPage>{
  final AuthenticationService _authenticationService =  AuthenticationService();




  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
            child: MaterialButton(
                onPressed:(){
                   _authenticationService.login();
                },
                minWidth: 200,
                height: 50,
                color: Colors.deepOrangeAccent,
                child: Text("Sign In", style: TextStyle().copyWith(
                      color: Colors.black,
                      fontSize: 12
                ),),

                ),
        ),
      );
  }
    
}