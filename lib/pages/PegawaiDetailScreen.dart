import 'package:flutter/material.dart';
import '../shared/Shared.dart';




class PegawaiDetailScreen extends StatelessWidget {
  const PegawaiDetailScreen({ Key key }) : super(key: key);

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
    final Map<String,Object> pegawai = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Shared.primaryColor,
        title: Text('Detail Pegawai'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
                margin: const EdgeInsets.only(top:25),
                height: 200,
                child: Card(
                  color: Shared.primaryColor,
                  // gradient: Gradients.hersheys,
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Card(
                            //   backgroundColor: Colors.transparent,
                            //   child: Image.asset('assets/images/dummyuser.png'),
                            //   radius: 50,
                            // )
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/aziz.png'),
                                  fit: BoxFit.cover
                                )
                              ),
                              // child: Image.asset('assets/images/aziz.png',fit: BoxFit.contain,),
                            ),
                            Container(
                              width: 190,
                              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                  // ===========================  Tanpa Menggunakan FittedBOX text !!!!!!!!!!!! ==================================

                                  FittedBox(
                                    child: Text( 
                                        pegawai['nama_pegawai'],
                                        maxLines: 2,
                                        style: Shared.fontStyle2.copyWith(
                                          color: Colors.white,
                                          fontSize: 18
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                  ),
                                  SizedBox(height: 5,),
                                    FittedBox(
                                      child: Text(
                                        (pegawai['nip'] as String).isNotEmpty ? pegawai['nip'] : '-',
                                        style: Shared.fontStyle2.copyWith(
                                          color: Colors.grey,
                                          fontSize: 14
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                    
                                ],
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: 20,),
                       
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          color: Shared.color3.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.work_outline,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        FittedBox(child: Text(
                                          pegawai['pegawaiDJP'] == 1 ? 'DJP' : 'Non DJP'
                                          ,style: Shared.fontStyle2.copyWith(fontSize: 11),)),
                                      ],
                                    ),
                                ),
                                Expanded(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.location_on,color: Colors.white,),
                                        SizedBox(width: 5,),
                                        Text('Indonesia',style: Shared.fontStyle2.copyWith(fontSize: 11),),
                                      ],
                                    ),
                                ),
                                
                              ],
                            ),
                          ),
                        )
                       
                      ],
                    ),
                  ),
                ),
          ),
          const SizedBox(height: 25,),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  this._detilInfo('Alamat',pegawai['alamat_current']),
                  const SizedBox(height: 15,),
                  this._detilInfo('Instansi', pegawai['eselon2']),
                  const SizedBox(height: 15,),
                  this._detilInfo('Unit Eselon 3', pegawai['eselon3']),
                  const SizedBox(height: 15,),
                  this._detilInfo('jabatan', pegawai['jabatan']),
                  const SizedBox(height: 15,),
                  this._detilInfo('Tgl Lahir', pegawai['tglahir'].toString()),
                  const SizedBox(height: 20,),
                  this._detilInfo('alamat homebase', pegawai['alamat_hombase']),
                  const SizedBox(height: 15,),
                  this._detilInfo('nama pasangan',pegawai['nama_pasangan']),
                  const SizedBox(height: 15,),
                  this._detilInfo('nip 9', pegawai['nip9']),
                  const SizedBox(height: 15,),
                  this._detilInfo('instansi', pegawai['eselon2']),
                  const SizedBox(height: 15,),
                  this._detilInfo('eselon 3', pegawai['eselon3']),
                  const SizedBox(height: 15,),
                  this._detilInfo('eselon 4', pegawai['eselon4']),
                  const SizedBox(height: 15,),
                  this._detilInfo('tempat lahir', pegawai['tempatl']),
                  const SizedBox(height: 15,),
                  this._detilInfo('tgl lahir', pegawai['tglahir']),
                  const SizedBox(height: 15,),
                  this._detilInfo('email', pegawai['email']),
                  const SizedBox(height: 15,),
                  this._detilInfo('telepon', pegawai['telepon']),
                  const SizedBox(height: 15,),
                  this._detilInfo('nama bank', pegawai['namarek']),
                  const SizedBox(height: 15,),
                  this._detilInfo('no rekening', pegawai['norek']),
                  const SizedBox(height: 15,),
                  this._detilInfo('riwayat penyakit', pegawai['penyakit'])
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}