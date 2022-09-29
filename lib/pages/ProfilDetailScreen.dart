import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';
import '../shared/Shared.dart';

class ProfilDetailScreen extends StatelessWidget {
  const ProfilDetailScreen({ Key key }) : super(key: key);


  Widget _detilInfo(String title,String text) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,style: Shared.fontStyle1.copyWith(fontSize: 13),maxLines: 2,),
      Flexible(flex: 1,child: SizedBox(width: 25,)),
      Expanded(
        flex: 2,
        child: Text(
              text == null ? "-" : text,
              style: Shared.fontStyle2.copyWith(fontSize: 12,color: Colors.grey),
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
        ),
      )

    ],
  );

  @override 
  Widget build(BuildContext context) {
    final data = Provider.of<Duwit>(context).detailUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Profil'),

      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            // margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data['nama_pegawai'],style: Shared.fontStyle1.copyWith(fontSize: 15),),
                  SizedBox(height: 10,),
                  Text(data['nip'],style: Shared.fontStyle2.copyWith(color: Colors.grey,fontSize: 13),),
                ],
              ),
            ),
          ),
          SizedBox(height: 25,),
          Text('Info Detail',style: Shared.fontStyle1.copyWith(fontSize: 14),),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  this._detilInfo('alamat homebase', data['alamat_hombase']),
                  const SizedBox(height: 15,),
                  this._detilInfo('nama pasangan',data['nama_pasangan']),
                  const SizedBox(height: 15,),
                  this._detilInfo('nip 9', data['nip9']),
                  const SizedBox(height: 15,),
                  this._detilInfo('instansi', data['eselon2']),
                  const SizedBox(height: 15,),
                  this._detilInfo('eselon 3', data['eselon3']),
                  const SizedBox(height: 15,),
                  this._detilInfo('eselon 4', data['eselon4']),
                  const SizedBox(height: 15,),
                  this._detilInfo('tempat lahir', data['tempatl']),
                  const SizedBox(height: 15,),
                  this._detilInfo('tgl lahir', data['tglahir']),
                  const SizedBox(height: 15,),
                  this._detilInfo('email', data['email']),
                  const SizedBox(height: 15,),
                  this._detilInfo('telepon', data['telepon']),
                  const SizedBox(height: 15,),
                  this._detilInfo('nama bank', data['namarek']),
                  const SizedBox(height: 15,),
                  this._detilInfo('no rekening', data['norek']),
                  const SizedBox(height: 15,),
                  this._detilInfo('riwayat penyakit', data['penyakit'])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}