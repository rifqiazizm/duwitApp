import 'dart:ui';

import 'package:duwit/shared/Shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../shared/Shared.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';

class PembayaranInfo extends StatelessWidget {
  const PembayaranInfo({ Key key,this.media }) : super(key: key);

  final Size media;



  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat();
    final reminder = Provider.of<Duwit>(context).reminder;
    final totalBayarUser = Provider.of<Duwit>(context).miscPembayaran['totalBayarUser'];
    final totalPengeluaran = Provider.of<Duwit>(context).pengeluaranKas;
    // print(reminder);
    // print(totalBayarUser);
    // print(totalPengeluaran);
    print(Provider.of<Duwit>(context).detailUser);

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInBack,

      // height: 3,
      child: Column(
        children: [
          Consumer<Duwit>(
            builder: (ctx,duwit,child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: media.width * 0.35,
                  child: ListTile(
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    minLeadingWidth: 30,
                    contentPadding: const EdgeInsets.all(0),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 5,right: 10),
                      child: Icon(Icons.fact_check,size: 25,),
                    ),
                    title: Text('Pembayaran',style: Shared.fontStyle1.copyWith(fontSize: 13),),
                    subtitle: Text(formatter.format(totalBayarUser),style: Shared.fontStyle2.copyWith(fontWeight: FontWeight.w700,color: Colors.black87),),
                  ),
                ),
                Container(
                  width: media.width * 0.35,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/pengeluaran');
                    },
                    child: ListTile(
                      minVerticalPadding: 0,
                      horizontalTitleGap: 0,
                      minLeadingWidth: 30,
                      contentPadding: const EdgeInsets.all(0),
                      leading: Padding(
                        padding: const EdgeInsets.only(top:5.0,right: 10),
                        child: Icon(Icons.outbond_outlined ,size: 30,),
                      ),
                      title: Text('Pengeluaran',style: Shared.fontStyle1.copyWith(fontSize: 13),),
                      subtitle: Text(formatter.format(totalPengeluaran),style: Shared.fontStyle2.copyWith(fontWeight: FontWeight.w700,color: Colors.black87),),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          Divider(
            color: Colors.grey,
            // thickness: 0,
          ),
          SizedBox(height: 15,),
          Container(
            width: double.infinity,
            // height: 160,
            // padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Shared.color5,
              borderRadius: BorderRadius.circular(15)
            ),
            child: ListTile(
              trailing: null,
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.all(20),
              dense: false,
              horizontalTitleGap: 25,
              // minVerticalPaddi
              title: Padding(
                padding: const EdgeInsets.only(bottom:10),
                child: Text(
                  'Reminder!!',
                  style: Shared.fontStyle1.copyWith(fontSize: 20,fontWeight: FontWeight.normal,color: Shared.color2),
                ),
              ),
              subtitle: Text(
                reminder,
                style: Shared.fontStyle2.copyWith(color: Colors.black87,fontSize: 13),
                textAlign: TextAlign.left,
              ),
              leading: Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Icon(Icons.notification_important_rounded,color: Shared.color3,size: 45,),
              ),
            ),
          ),
    
        ]
      )
    );
  }
}