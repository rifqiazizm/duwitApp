import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';
import '../shared/Shared.dart';
import '../provider/duwitProvider.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Duwit>(context).miscPembayaran;
    final int pegDJP = data['pegawaiDJP'];
    final int pegawai = data['totalPegawai'];
    final media = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(10),
      height: 75,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Shared.color5,
        boxShadow: [
          BoxShadow(color: Colors.grey[300],spreadRadius: 0.1,blurRadius: 8.5,offset: Offset(5,7))
        ]
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(Icons.group,size: 55,color: Shared.primaryColor,),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jumlah Pegawai',
                  style: Shared.fontStyle1.copyWith(fontSize: 14,),
                ),
                SizedBox(height: 5,),
                Text(
                  'DJP $pegDJP / non DJP ${pegawai - pegDJP}',
                  style: Shared.fontStyle2.copyWith(color: Colors.black87,letterSpacing: 1.5,fontSize: 13),
                )
              ],
            ),
          ),
          Text(
            pegawai.toString(),
            style: TextStyle(
              color: Shared.color3,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 15,)
        ],
      ),

    );
  }
}