import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';
import '../shared/Shared.dart';
import '../misc/HomeInfoCard.dart';



class ProfilScreen extends StatelessWidget {
  ProfilScreen({ Key key,@required this.media }) : super(key: key);

  final Size media;

  void _onClick(BuildContext context) {
    Navigator.of(context).pushNamed('/loginscreen');
  }


  Widget _detilInfo(String title,String text) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,style: Shared.fontStyle1.copyWith(fontSize: 13)),
      Flexible(flex: 1,child: SizedBox(width: 25,)),
      Expanded(
        flex: 2,
        child: Text(
              text == null ? "-" : text,
              style: Shared.fontStyle2.copyWith(fontSize: 13,color: Colors.black54),
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
        ),
      )

    ],
  );


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          physics: BouncingScrollPhysics(),
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
            SizedBox(height: 30,),
            // Text(
            //   'Rekapitulasi',
            //   style: Shared.fontStyle2,
            // ),
            // SizedBox(height: 15,),
            Consumer<Duwit>(
              builder: (ctx,duwit,child) => Container(
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
                                        duwit.detailUser['nama_pegawai'],
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
                                        (duwit.detailUser['nip'] as String).isEmpty ? '-' : duwit.detailUser['nip'],
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
                                          duwit.detailUser['pegawaiDJP'] == 1 ? 'DJP' : 'Non DJP'
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
            ),
            SizedBox(height: 25,),
            HomeInfoCard(),
            
            const SizedBox(height: 15,),
            // const SizedBox(height: 20,),
            
            Text(
              'Informasi Pegawai',
              style: Shared.fontStyle1.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 25,),
            Consumer<Duwit>(
              builder: (ctx,duwit,child) => Card(
                elevation: 5 ,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      this._detilInfo('Nama',duwit.detailUser['nama_pegawai']),
                      const SizedBox(height: 15,),
                      this._detilInfo('Alamat',duwit.detailUser['alamat_current']),
                      const SizedBox(height: 15,),
                      this._detilInfo('Instansi', duwit.detailUser['eselon2']),
                      const SizedBox(height: 15,),
                      this._detilInfo('Unit Eselon 3', duwit.detailUser['eselon3']),
                      const SizedBox(height: 15,),
                      this._detilInfo('jabatan', duwit.detailUser['jabatan']),
                      const SizedBox(height: 15,),
                      this._detilInfo('Tgl Lahir', duwit.detailUser['tglahir'].toString()),
                      const SizedBox(height: 20,),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/detailProfil');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'info detail',
                              style: Shared.fontStyle1.copyWith(color: Shared.primaryColor,fontSize: 13,decoration: TextDecoration.underline)
                            ),
                            const SizedBox(width: 5,),
                            Icon(Icons.arrow_forward_ios_rounded,color: Shared.primaryColor,size: 15,)
                          ]
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Card(
            //       color: Shared.color5,
            //       elevation: 3,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            //       child: Padding(
            //         padding: const EdgeInsets.all(10),
            //         child: Text(
            //           'Informasi Detail'
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            
            const SizedBox(height: 35,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/editProfil');
              },

              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 3,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Shared.color2,width: 1),
                )

              ),
              child: Text('Ubah Profil',style: Shared.fontStyle2.copyWith(fontSize: 12,color: Shared.color2,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () {
                Provider.of<Duwit>(context,listen: false).logOut();
                Navigator.of(context).pushReplacementNamed('/loginscreen');
              },
              style: ElevatedButton.styleFrom(
                primary: Shared.color2,
                elevation: 3,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

              ),
              child: Text('Log Out!',style: Shared.fontStyle2,),
            ),
            const SizedBox(height: 70,),

          ],
        ),
      );

  }
}