import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';
import '../shared/Shared.dart'; 

class PengeluaranScreen extends StatelessWidget {
  const PengeluaranScreen({ Key key }) : super(key: key);

  Widget _cardPengeluaran({int id,String text = '-',int nominal = 0,String title = '-'}) => Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: ExpansionTile(
      key: Key(id.toString()),
      title: Text(title,style: Shared.fontStyle1.copyWith(fontSize: 11),),
      leading: Icon(Icons.money_off_rounded),
      tilePadding: const EdgeInsets.all(5),
      childrenPadding: const EdgeInsets.all(15),
      expandedCrossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(text,style: Shared.fontStyle2.copyWith(color: Colors.grey),),
        const SizedBox(height: 15,),
        Divider(color: Colors.grey,),
        Text('Rp. '+nominal.toString())

      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    final pengeluaran = Provider.of<Duwit>(context).detilPengeluaran;
    print(pengeluaran);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengeluaran',
        ),
      
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: pengeluaran.length,
        itemBuilder: (context,int) => this._cardPengeluaran(
          id: pengeluaran[int]['id'],
          title: pengeluaran[int]['value1'],
          text: pengeluaran[int]['value2'],
          nominal: pengeluaran[int]['number1']

        ),
      )
    );
  }
}