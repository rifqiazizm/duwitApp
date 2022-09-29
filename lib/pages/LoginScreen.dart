import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/Shared.dart';
import '../provider/duwitProvider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key key }) : super(key: key);

  @override 
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  
  var _formValue = {
    'nip' : '',
    'password' : ''
  };
  var _isLoading = false;


  void _onSaveForm() async {
    setState(() {
      this._isLoading = true;      
    });
    this._formKey.currentState.save();
    if(this._formKey.currentState.validate()) {
      final teslogin = await Provider.of<Duwit>(context,listen: false).tesLogin(this._formValue);
      if(teslogin['status']) {
        Navigator.of(context).pushReplacementNamed('/app');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(teslogin['text']),
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          )
        );
      }
    }
    setState(() {
        this._isLoading = false;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: this._formKey,
            child: ListView(
              children: [
                const SizedBox(height: 65),
                Image.asset('assets/images/djpicon.png',width: 120 ,height: 120 ),
                const SizedBox(height: 15),
                Text(
                  'Angkatan 1999',
                  // style: Shared.fontStyle1.copyWith(fontSize: 21),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    letterSpacing: 1.5, 
                    fontSize: 21,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'NIP 9 Digit',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Shared.primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(15) ,
                      borderSide: BorderSide(color: Shared.color3,) 
                    )
                  ),
                  enableSuggestions: true,
                  autocorrect: false,
                  onSaved: (val) {
                    this._formValue = {
                      ...this._formValue,
                      'nip' : val
                    };
                  },
                  validator: (val) {
                    if(val.isEmpty) {
                      return 'Field tidak boleh kosong';
                    } 
                    return null;
                  },
                ),
                SizedBox(height: 25,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Shared.primaryColor)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Shared.color3)
                    )
                  ),
                  onSaved: (val) {
                    this._formValue = {
                      ...this._formValue,
                      'password' : val
                    };
                  },
                  validator: (val) {
                    if(val.isEmpty) {
                      return 'Field Ga boleh Kosong!!';
                    }
                    return null;
                  }, 
                ),
                const SizedBox(height: 35,),
                ElevatedButton(
                  onPressed: this._onSaveForm,
                  child: this._isLoading ? CircularProgressIndicator(backgroundColor: Colors.white,) : Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    elevation: 5,
                    padding: const EdgeInsets.all(13),
                    primary: Shared.color2, 
                    // primary: Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}