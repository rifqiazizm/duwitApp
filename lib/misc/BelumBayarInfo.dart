import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';
import '../shared/Shared.dart';

class BelumBayarInfo extends StatelessWidget {
  const BelumBayarInfo({ Key key }) : super(key: key);


  Widget _pegawaiNunggak(int id,String nama, String instansi) {  
    print('ngeprint gan');
    return ListTile(
            key: Key(id.toString()),
            horizontalTitleGap: 0,
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            title: Text(
              nama,
              style: Shared.fontStyle1.copyWith(fontSize: 11),
            ),
            subtitle: Text(
              instansi,
              style: Shared.fontStyle2.copyWith(color: Colors.grey),
            ),
            trailing: Icon(Icons.money_off_outlined,color: Colors.grey,),
  );
  }
  @override
  Widget build(BuildContext context) {
    final pegNunggak = Provider.of<Duwit>(context).pegawaiBelumBayar;
    final mediaQ = MediaQuery.of(context).size.height;
    return Container(
      height: mediaQ * 0.6,
      padding: const EdgeInsets.only(bottom: 35),
      alignment: Alignment.center,
      child: ListView.separated(
        separatorBuilder: (ctx,i) => Divider(color: Colors.black54,),
        itemCount: pegNunggak.length,
        itemBuilder: (ctx,i) => this._pegawaiNunggak(pegNunggak[i]['id'], pegNunggak[i]['nama_pegawai'],pegNunggak[i]['eselon2']),
        padding: const EdgeInsets.all(15),


      ),
    );
  }
}