import 'package:duwit/pages/PembayaranScreen.dart';
import 'package:duwit/pages/PencarianScreen.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';
import 'HomeScreen.dart';
import 'ProfilScreen.dart';
import 'package:flutter/material.dart';
import '../shared/Shared.dart';



class TabScreen extends StatefulWidget {
  const TabScreen({ Key key }) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  Size media;
  var _isInit = true;
  PageController _pageController;
  var _bottomNavbarIndex = 0;


  @override
    void didChangeDependencies() {
      // TODO: implement didChangeDependencies
      if(this._isInit) {
        this.media = MediaQuery.of(context).size;
        this._pageController = PageController(initialPage: this._bottomNavbarIndex);
        Provider.of<Duwit>(context,listen:false).getPengeluaran();
        Provider.of<Duwit>(context,listen: false).getPembayaran();
        Provider.of<Duwit>(context,listen: false).getReminder();
        Provider.of<Duwit>(context,listen: false).getAllPegawai();
      }
      this._isInit = false;
      super.didChangeDependencies();
    }



  void _onNavbarClick(int ind) {
    setState(() {
      this._bottomNavbarIndex = ind;      
    });
    this._pageController.jumpToPage(ind);
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
            
          ),
          PageView(
            controller: this._pageController,
            onPageChanged: (ind) {
              setState(() {
                this._bottomNavbarIndex = ind;                
              });
            },
            children: [
              HomeScreen(media: this.media),
              PembayaranScreen(media: this.media,),
              PencarianScreen(),
              ProfilScreen(media : this.media),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // padding: const EdgeInsets.symmetric(vertical:15,horizontal: 25),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                // color: Colors.white,
                color: Shared.color5,
                borderRadius: BorderRadius.circular(15)
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Icon(Icons.home,color: Colors.white,size: 30,),
              //     Icon(Icons.attach_money,color: Colors.white,size: 30,),
              //     Icon(Icons.search_outlined,color: Colors.white,size: 30),
              //     Icon(Icons.person,color: Colors.white,size: 30),
                  
              //   ],
              // ),
              child: BottomNavigationBar(
                iconSize: 27,
                elevation: 0,
                currentIndex: this._bottomNavbarIndex,
                selectedItemColor: Shared.color3,
                unselectedItemColor: Colors.black,
                onTap: this._onNavbarClick,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Shared.color5,
                    icon: Icon(Icons.home),
                    label: ''
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money_outlined),
                    label: ''
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined),
                    label: ''
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: ''
                  )

                ],
              ),
            ),
          )
        ],  
      ),
    );
  }
}