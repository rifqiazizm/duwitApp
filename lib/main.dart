import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/duwitProvider.dart';
import './pages/TabScreen.dart';
import './pages/ProfilDetailScreen.dart';
import './pages/UploadBuktiScreen.dart';
import './pages/SplashScreen.dart';
import './pages/LoginScreen.dart';
import './pages/EditProfilScren.dart';
import './pages/PegawaiDetailScreen.dart';
import './pages/PengeluaranScreen.dart';
// import './shared/Shared.dart';




  void main() {
  runApp(MyApp());
}  



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Duwit())
      ],
      child: MaterialApp(
        title: 'Duwit', 
        theme: ThemeData(
          fontFamily: 'Lato',
          primaryColor: Colors.brown,
          textTheme: TextTheme(
          
          )
        ),
        initialRoute: '/',
        routes: {              
          '/' : (ctx) => SplashScreen(),
          '/app' : (ctx) => TabScreen(),
          '/buktibayar' : (ctx) => UploadBuktiScreen(),
          '/loginscreen' : (ctx) => LoginScreen(),
          '/splash' : (ctx) => SplashScreen(),
          '/detailProfil' : (ctx) => ProfilDetailScreen(),
          '/editProfil' : (ctx) => EditProfilScreen(),
          '/detailPegawai' : (ctx) => PegawaiDetailScreen(),
          '/pengeluaran' : (ctx) => PengeluaranScreen()
        },
      ),
    );
  }
}
