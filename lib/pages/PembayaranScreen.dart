import 'package:duwit/misc/BelumBayarInfo.dart';
import 'package:duwit/misc/PembayaranInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../shared/Shared.dart';
import '../misc/SlidingUpContent.dart';
import '../provider/duwitProvider.dart';

class PembayaranScreen extends StatefulWidget {
  const PembayaranScreen({ Key key,this.media }) : super(key: key);

  final Size media;

  @override
  _PembayaranScreenState createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {


  var _selectedTab = 0;
  var _isInit = false;
 
  @override
    void didChangeDependencies() {
    
      if (!this._isInit) {
        Provider.of<Duwit>(context,listen: false).getBelumBayar();
      }
      this._isInit = true;
      super.didChangeDependencies();
    }

 void _onClickTab(int tabValue) {
    setState(() {
      this._selectedTab = tabValue;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white,),
        SafeArea(
          child: SlidingUpPanel(
            parallaxEnabled: true,
            minHeight: widget.media.height * 0.3 ,
            maxHeight:  widget.media.height * 0.8,
            body: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Shared.color5,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    // width: widget.media.width * 0.85,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Card(
                            borderOnForeground: false,
                            elevation: 0,
                            // elevation: this._selectedTab == 0 ? 3 : 0 ,
                            color: this._selectedTab == 0 ? Shared.color3 : Shared.color5 ,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                              onTap: () => this._onClickTab(0),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Kas Pribadi',
                                  style: Shared.fontStyle1.copyWith(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),  
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            // elevation: this._selectedTab == 0 ? 0 : 3 ,
                            elevation: 0,
                            color: this._selectedTab == 0 ? Shared.color5 :  Shared.color3 ,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                              onTap: () => this._onClickTab(1),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Belum Bayar',
                                  style: Shared.fontStyle1.copyWith(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),  
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),
                  this._selectedTab == 0 ? 
                  PembayaranInfo(
                    media: widget.media,
                    // reminder: this.reminder,
                    // totalBayar : this.totalBayarUser,
                    // totalPengeluaran : this.totalPengeluaran
                  ) : BelumBayarInfo()
                ],
              ),
            ),
            panelBuilder: (controller) => SlidingUpContent(controller: controller),
          ),
        )
      ],
    );
  }
}