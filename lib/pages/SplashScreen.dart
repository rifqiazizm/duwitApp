import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/duwitProvider.dart';
import '../shared/Shared.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();    
}



class _SplashScreenState extends State<SplashScreen> {


  Timer _loadWidget() {
    final durasi = Duration(seconds: 3);
    return Timer(durasi, this._navigate);
  }
 
  Future<void> _navigate() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('userData')) {
      final userdata = prefs.getString('userData');
      final data = json.decode(userdata) as Map<String,Object>;
      Provider.of<Duwit>(context,listen: false).adduser(data);
      Navigator.of(context).pushReplacementNamed('/app');
    } else {
      Navigator.of(context).pushReplacementNamed('/loginscreen');
    }
  }


  @override
    void initState() {
      this._loadWidget();
      super.initState();
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Shared.color2,
        alignment: Alignment.center, 
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/djpicon.png',width: 100,height: 100,),
            const SizedBox(height: 50,),
            Text('Duwit vApp',style: TextStyle(fontFamily: 'Roboto',fontSize: 25,letterSpacing: 2,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}