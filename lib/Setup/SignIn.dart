import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:social_albania/main.dart';
import 'package:flutter/widgets.dart';
class LoginPage extends StatefulWidget {
  @override

  _LoginPageState createState() => new _LoginPageState();

}
class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState> ();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text('CivilSpeak'),
        ),
      body: SingleChildScrollView(
        child: Container(



          child: Form(
          key: _formKey,
          child: Column (
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(

                  child: Image.asset('images/sch.png')
              ),

              Container(

             child: TextFormField(


               validator: (input)  {
               if(input.isEmpty){
                 return 'Please enter an email';
               }
               },
               onSaved: (input) => _email = input,
               style: TextStyle(color: Colors. black),
               decoration: InputDecoration(
                 filled: true,

                labelText: 'Email',

                 focusedBorder:OutlineInputBorder(
               borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(50.0),
          ),
               ),
             ),
          ),
              Container (

              child: TextFormField(

                validator: (input)  {
                  if(input.isEmpty){
                    return 'Please enter a password';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  filled: true,

                  labelText: 'Password',

                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),



                obscureText: true,
              ),
              ),
              Container(
                width: 100,
                child: RaisedButton(
                    child: Row(
                      children: <Widget>[
                        //Icon(LineIcons.alternate_sign_in),
                        Spacer(),
                        Text('Sign in'),
                        Spacer(),
                      ],
                    ),
                    onPressed: () {
                      signIn();
                    }),
              ),

            ],

          ),
        ),
    ),
      ),

    );
    throw UnimplementedError();
  }
void signIn() async {
    final _form = _formKey.currentState;
    if(_form.validate()){
      _form.save();
      try{
         //FirebaseUser user = await
        FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } catch(e) {
    print(e.message);
      }
}
}}