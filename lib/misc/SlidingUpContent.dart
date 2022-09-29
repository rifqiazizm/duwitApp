import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../shared/Shared.dart';
import '../provider/duwitProvider.dart';

class SlidingUpContent extends StatefulWidget {
  const SlidingUpContent({ Key key,this.controller }) : super(key: key);

  final ScrollController controller;

  @override
  State<SlidingUpContent> createState() => _SlidingUpContentState();
}

class _SlidingUpContentState extends State<SlidingUpContent> {

  var _isInit = false;
  Size media;
  var tarif = 50000;
  var _rincian = [];


  @override
    void didChangeDependencies() {
      if (!_isInit) {
        this.media = MediaQuery.of(context).size;
        this.tarif = Provider.of<Duwit>(context).tarifKas;
        this._rincian = Provider.of<Duwit>(context).rincianPembayaran;
        this._isInit = true;
      }
      print(this._rincian);
      super.didChangeDependencies();
      print(DateFormat('MMMM').format(DateTime(2022,2)) );
    }
  
  Widget _pembayaranBulan(int bulan) { 
    bool udhBayar = false;
    for (var i=0 ;i < this._rincian.length ;i++) {
  
      if(this._rincian[i]['bulan'] == bulan) {
        udhBayar = true;
      }
    }
    print('bulan $bulan status bayarnya $udhBayar');
    return ListTile(
      key: Key(bulan.toString()),
      trailing: Icon(udhBayar ? Icons.check_box : Icons.cancel_presentation_rounded,size: 25,),
      title: Text(DateFormat('MMMM').format(DateTime(2022,bulan)).toString(),style: Shared.fontStyle1.copyWith(fontSize: 12),),
      subtitle: Text('Rp. '+this.tarif.toString(),style: Shared.fontStyle2.copyWith(fontWeight: FontWeight.w700,color: Colors.black87),),
    );
  }

  Widget _divider() => Divider(
    color: Colors.grey,
  );

  void _onClick() => {
    Navigator.of(context).pushNamed('/buktibayar')
  };


  @override
  Widget build(BuildContext context) {
    return ListView(
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.all(20),
      controller: widget.controller,
      children: [
        Text('Rekap Pembayaran',style: Shared.fontStyle1.copyWith(fontSize: 13),),
        SizedBox(height: 20,),
        ElevatedButton(
          onPressed: this._onClick,
          child: Text('Upload Bukti Bayar',style: Shared.fontStyle2,),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            elevation: 5,
            primary: Shared.color2,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          ),
        ),
        SizedBox(height: 15,),
        this._pembayaranBulan(1),
        this._divider(),
        this._pembayaranBulan(2),
        this._divider(),
        this._pembayaranBulan(3),
        this._divider(),
        this._pembayaranBulan(4),
        this._divider(),
        this._pembayaranBulan(5),
        this._divider(),
        this._pembayaranBulan(6),
        this._divider(),
        this._pembayaranBulan(7),
        this._divider(),
        this._pembayaranBulan(8),
        this._divider(),
        this._pembayaranBulan(9),
        this._divider(),
        this._pembayaranBulan(10),
        this._divider(),
        this._pembayaranBulan(11),
        this._divider(),
        this._pembayaranBulan(12),
        this._divider(),
        
        SizedBox(height: 90,)

      ],
    );
  }
}