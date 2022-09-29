import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/Shared.dart';
import '../provider/duwitProvider.dart';



class PencarianScreen extends StatefulWidget {
  const PencarianScreen({ Key key }) : super(key: key);

  @override
  State<PencarianScreen> createState() => _PencarianScreenState();
}

class _PencarianScreenState extends State<PencarianScreen> {

  var _namaFilter = false;
  var _instansiFilter = false;
  var _asalFilter = false;
  var _isInit = false;
  var _allPegawai = {};


  @override
    void didChangeDependencies() {
      if(!this._isInit) {
          setState(() {
            this._allPegawai = {
              ...Provider.of<Duwit>(context,listen :false).AllGroupedPegawai
            };
          });

 
      }
      this._isInit = true;
      // if(this._allPegawai.length == 0) {
      //   setState(() {
      //     this._allPegawai = {
      //       ...Provider.of<Duwit>(context,listen :false).AllGroupedPegawai
      //     };
      //   });
       
      // }
      super.didChangeDependencies();
    }
    

  void _toggleFilter(String filter)  {

    switch(filter) {
      case 'nama':
        setState(() {
          this._namaFilter = !this._namaFilter;          
        });
        break;
      case 'asal':
        setState(() {
          this._asalFilter = !this._asalFilter;          
        });
        break;
      case 'instansi':
        setState(() {
          this._instansiFilter = !this._instansiFilter;          
        });
        break;
      default:
    }
  }

  Widget _renderFilter(String filter,bool selected) => InkWell(
    onTap: () => this._toggleFilter(filter),
    child: Card(
      color: selected ? Shared.color3 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal :20,vertical: 10),
        child: Text(
          filter,
          style: Shared.fontStyle1.copyWith(fontSize: 13,color: selected ? Colors.white : Colors.black),
        ),
      ),
    ),
  );


  List _groupEselon() {
    for(var key in this._allPegawai.keys) {

    }


  }


  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField( 
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Cari Pegawai',
                labelStyle: Shared.fontStyle2.copyWith(fontSize: 11,color: Colors.grey),
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Shared.primaryColor),borderRadius: BorderRadius.circular(15))
              ),
              enableSuggestions: true,
              keyboardType: TextInputType.text,
              onChanged: (String val) {},
              
            ),
            const SizedBox(height: 25,),
            Text(
              'Pencarian Berdasarkan',
              style: Shared.fontStyle1.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                this._renderFilter('nama',this._namaFilter),
                this._renderFilter('instansi',this._instansiFilter),
                this._renderFilter('asal',this._asalFilter)
              ],
            ),
            const SizedBox(height: 25,),
            Text('Eselon 2 Pegawai',style: Shared.fontStyle1.copyWith(fontSize: 15),),
            const SizedBox(height: 15,),
            // ExpansionTile(
            //   title: Text('Direktorat DIP',style: Shared.fontStyle2.copyWith(fontSize: 11,color: Colors.grey),),
            //   backgroundColor: Colors.white,
            //   childrenPadding: const EdgeInsets.all(15),
            //   children: [],
            // ),
            
            for(var key in this._allPegawai.keys) ExpansionTile(
              title: Text(key,style: Shared.fontStyle2.copyWith(fontSize: 14,color: Colors.black54),),
              backgroundColor: Colors.white,
              childrenPadding: const EdgeInsets.all(15),
              children: [
                for(Map<String,Object> item in this._allPegawai[key]) InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/detailPegawai',arguments: item);
                  },
                  child: ListTile(
                    minLeadingWidth: 0,
                    // contentPadding: const EdgeInsets.all(value),
                    minVerticalPadding: 0,
                    leading: Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: Icon(Icons.circle,size: 10,),
                    ),
                    title: Text(item['nama_pegawai'],style: Shared.fontStyle1.copyWith(fontSize: 14),),
                    subtitle: Text(item['eselon3'],style: Shared.fontStyle2.copyWith(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w700),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}