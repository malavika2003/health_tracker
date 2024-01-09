import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final  _firebase = FirebaseAuth.instance;
class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() {
     return _AuthScreenState();
  }
}

 class _AuthScreenState extends State<AuthScreen>{
  final _form = GlobalKey<FormState>();
   var _isLogin = true;
   var _enteredEmail = '';
   var _enteredUsername = '';
   var _enteredPassword = '';
   void _submit() async{
    final isValid = _form.currentState!.validate();
   if(!isValid){
     return;
   }
    _form.currentState!.save();
    try {
      if (_isLogin) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail,
            password: _enteredPassword);

        //print(userCredentials);
      }
      else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail,
            password: _enteredPassword);
        //print(userCredentials);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username' : _enteredUsername,
          'email': _enteredEmail,

        });
      }
    }on FirebaseAuthException catch(error){
        if(error.code == 'email-already-in-use'){
          //..
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(error.message ?? 'Authentication failed.'),
          ),
        );
      }

   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 500,
                child : const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/cutebunny.jpg'),
                  radius: 200,

                ),

                ),

              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value){
                              if(value == null || value.trim().isEmpty || !value.contains('@')){
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),

                          if(!_isLogin)
                          TextFormField(
                            decoration: const InputDecoration(labelText: 'Username'),
                            enableSuggestions: false,
                            validator: (value){
                              if(value == null || value.isEmpty || value.trim().length<4){
                                return 'Please enter at least 4 characters.';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _enteredUsername = value!;
                            },
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                          obscureText: true,
                              validator: (value){
                                if(value == null || value.trim().length < 6){
                                  return 'Password must be at least 6 characters long.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                              _enteredPassword = value!;
                              },
                          ),
                          const SizedBox(height: 12,),
                          ElevatedButton(
                              onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.tertiary
                            ),
                              child:  Text(_isLogin ? 'Login' :'Signup'),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(_isLogin
                                  ? 'Create an account'
                              : 'I already have an account',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
 }