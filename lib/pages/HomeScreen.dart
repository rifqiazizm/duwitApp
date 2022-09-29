import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';
import '../shared/Shared.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({ Key key,this.media }) : super(key: key);

  final Size media;

  final TextStyle _title = Shared.fontStyle1.copyWith(fontSize: 15);
  final TextStyle _subtitle = Shared.fontStyle2.copyWith(fontSize: 12,color: Colors.black87);
  final TextStyle _rightText = Shared.fontStyle1.copyWith(color: Shared.color3,fontSize: 15);


  @override
  Widget build(BuildContext context) {
  // final nama = Provider.of<Duwit>(context).detailUser['nama'];
  final formatter = NumberFormat();
  final saiki = DateFormat('MMMM - yyyy').format(DateTime.now());
  
    return Consumer<Duwit>(
      builder: (ctx,duwit,child) => Stack(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topCenter,
              color: Shared.color5,
              // color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/images/djpicon.png',fit: BoxFit.cover,),
                      radius: 25,
                      ),
                      Text(
                        'Employee App',
                        style: Shared.fontStyle1.copyWith(
                          color: Shared.primaryColor
                        ),
                      ),
                      Icon(
                        Icons.notifications_outlined,
                        color: Colors.black54,
                        size: 33,
                      )
                    ],
                  ),
                  SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo!',
                                style: TextStyle(fontSize: 25,color: Colors.grey),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                  duwit.detailUser['nama_pegawai'],
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: Shared.fontStyle1.copyWith(fontSize: 13),       
                                ),

                              
                            ],),
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/images/aziz.png'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 35,),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Shared.color2,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo Total Angkatan',
                            textAlign: TextAlign.left,
                            style: Shared.fontStyle2,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Rp. ${formatter.format(duwit.miscPembayaran["saldoTotal"])}',
                                style: Shared.fontStyle2.copyWith(fontSize: 35),
                                
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  )
                  
                ],

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: this.media.height * 0.35,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.white
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                // itemExtent: 25,
                children: [
                
                  const SizedBox(height : 10),
                  Card(
                    color: duwit.miscPembayaran['udahBayar'] ? Shared.primaryColor : Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.all(15 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(duwit.miscPembayaran['udahBayar'] ? Icons.check_circle_outline : Icons.warning_amber_rounded,color: Colors.white,),
                          Text(
                            duwit.miscPembayaran['udahBayar'] ? 'Anda Sudah Membayar Kas' : 'Anda Belum Bayar Kas',
                            style: Shared.fontStyle2,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey,indent: 10,endIndent: 10,height: 10), // disamain sama content padding nya listtile biar sama
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal:10,vertical: 0),
                    leading: null,
                    title: Text('Pemasukan bulan ini',style: this._title), 
                    subtitle: Text('${duwit.miscPembayaran["pegBayarBlnIni"]} / ${duwit.miscPembayaran["totalPegawai"]} Pegawai',style: this._subtitle),
                    trailing: Text('${formatter.format(duwit.miscPembayaran["totalByrBlnIni"])}',style: this._rightText,),
                  ),
                  Divider(color: Colors.grey,indent: 10,endIndent: 10,height: 10,), // disamain sama content padding nya listtile biar sama
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal:10,vertical: 0),
                    leading: null,
                    title: Text('Target Per Bulan',style: this._title, ),
                    subtitle: Text(saiki,style: this._subtitle),
                    trailing: Text('${formatter.format(duwit.tarifKas * duwit.miscPembayaran["totalPegawai"])}',style: this._rightText),
                  ),
                  Divider(color: Colors.black,indent: 10,endIndent: 10,height: 10,), 
                  SizedBox(height: 35,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}