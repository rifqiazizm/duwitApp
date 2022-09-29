import 'package:provider/provider.dart';

import '../shared/Shared.dart';
import 'package:flutter/material.dart';
import '../provider/duwitProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class UploadBuktiScreen extends StatefulWidget {
  const UploadBuktiScreen({ Key key }) : super(key: key);

  @override
  State<UploadBuktiScreen> createState() => _UploadBuktiScreenState();

}

class _UploadBuktiScreenState extends State<UploadBuktiScreen> {

  var _checkedVal = {
    1 : false,
    2 : false,
    3 : false,
    4 : false,
    5 : false,
    6 : false, 
    7 : false,
    8 : false,
    9 : false,
    10: false,
    11: false,
    12: false
  };
  File _tmpFile;

  var _januari = true;
  var _isInit = false;
  int tarifKas = 50000;


  @override
    void didChangeDependencies() {
      if(!this._isInit) {
        this.tarifKas = Provider.of<Duwit>(context).tarifKas;
        print('ini tarif kas'+this.tarifKas.toString());
      }
      this._isInit = true;
      super.didChangeDependencies();
    }

  void _onChange(bool val,int bulan) => {
    
    setState(() {
        this._checkedVal = {
        ...this._checkedVal,
        bulan : val
      };
    }),
    print(val)
    
  };

  Future<void> _addImage() async {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if(pickedFile != null) {
        setState(() {
          this._tmpFile = File(pickedFile.path);        
        });
      } else {
        return;
      }
      
    }

  Future<void> _submit() async {
    final val = [];
    for(var data in this._checkedVal.keys) {
      if(this._checkedVal[data]) {
        val.add(data);
      }
    }


    final pembayaran = val.join(",");
   
    // print(formVal);
    final res = await Provider.of<Duwit>(context,listen: false).uploadTrf(pembayaran,this._tmpFile);
    if(res) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil Update',style: Shared.fontStyle2.copyWith(fontSize: 11),),
          backgroundColor: Colors.green,
        )
      );
    } else {
      SnackBar(
          content: Text('Gagal Update',style: Shared.fontStyle2.copyWith(fontSize: 11),),
          backgroundColor: Colors.red,
        );
    } 

  }

  



  Widget _checkBoxBulan(int number,String bulan) => CheckboxListTile(
    value: this._checkedVal[number],
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    onChanged: (bool currval) => this._onChange(currval,number),
    activeColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Text(bulan,style: Shared.fontStyle1.copyWith(fontSize: 11),),
    subtitle: Text('Rp ${this.tarifKas}',style: Shared.fontStyle2.copyWith(color: Colors.grey,fontSize: 10),),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Upload Bukti Transfer',style: Shared.fontStyle2.copyWith(fontSize: 16),),
       ),
       body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            InkWell(
              onTap: this._addImage,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                color: Shared.color5,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 20),
                  decoration: BoxDecoration(
                    image: this._tmpFile != null ? DecorationImage(
                      image: FileImage(this._tmpFile),
                      fit: BoxFit.cover,
                      alignment: Alignment.center
                    ) : null
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt,color: Colors.grey.withOpacity(0.7),size: 55,),
                      SizedBox(height: 25,),
                      Text('Klik untuk Ambil Gambar',style: Shared.fontStyle2.copyWith(color: Colors.grey,fontSize: 15),)
                    ], 
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            this._checkBoxBulan(1,'Januari'),
            this._checkBoxBulan(2,'Februari'),
            this._checkBoxBulan(3,'Maret'),
            this._checkBoxBulan(4,'April'),
            this._checkBoxBulan(5,'Mei'),
            this._checkBoxBulan(6,'Juni'),
            this._checkBoxBulan(7,'Juli'),
            this._checkBoxBulan(8,'Agustus'),
            this._checkBoxBulan(9,'September'),
            this._checkBoxBulan(10,'Oktober'),
            this._checkBoxBulan(11,'November'),
            this._checkBoxBulan(12,'Desember'),
            SizedBox(height: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(13),
                primary: Shared.color2,

              ),

              onPressed: this._submit,
              child: Text(
                'Submit Data!'
              ),
            )

          ], 
        ),
       ),
    );
  }
}