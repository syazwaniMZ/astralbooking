// ignore_for_file: prefer_const_constructors

import 'package:astralbooking/ui/roundedcontainer.dart';
import 'package:astralbooking/widgets/search_train.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text controllers
  final _nameController = TextEditingController();
  //final _passwordController = TextEditingController();
  late String _name = '';
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(child: 
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hi! Please enter name to proceed.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
                  ),
            
                SizedBox( height: 20,),
            
                Card(
                  margin: EdgeInsets.all(20),
                  child: RoundedContainer(
                    child: TextField(
                      controller: _nameController,
                      onChanged: (value){
                        setState(() {
                          _name = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                      ),
                    )
                  ),
                ),

                SizedBox( height: 5,),

            
                Card(
                  margin:EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: (){
                      print("Your name is $_name.");
                      if (_name != '') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchTrain(name: _name,)));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid input. Please fill in your name.')));
                      }
                      //TO DO: ERROR MESSAGE
                    },
                    child: Container(
                    decoration: BoxDecoration(color: Colors.indigo[800]),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical:20),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        ),
                      )
                    ),
                                      )
                  ),
                )
            
              ],
            ),
          )
        
      )
      )
      );
  }


}

void OnTapSignIn(String email) {
  //Authenticate
  
}