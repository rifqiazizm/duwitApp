import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Duwit with ChangeNotifier {


  int id;
  String nip;
  String password;
  Map<String, Object> detailUser; 
  String reminder;
  int pengeluaranKas;
  int tarifKas = 50000;
  Map<String,Object> AllGroupedPegawai = {};
  List<Map<String,Object>> detilPengeluaran;
  List<Map<String,Object>> pegawaiBelumBayar = [
  
  ];
  List<Map<String,Object>> rincianPembayaran = [
    {
      'id' : 1,
      'bulan' : 4,
      'tahun' : 2022,
      'jml_bayar' : 50000
    }
  ];
  var miscPembayaran = {
    'pegBayarBlnIni' : 0,
    'saldoTotal' : 37500000,
    'totalBayarUser' : 40000000,
    'udahBayar' : false,
    'totalByrBlnIni' : 1500000,
    'totalPegawai' : 361,

  };
  

  var _currentUser = {
    'id' : 1,
    'nama_pegawai' : 'Arman Imran',
    'nip9' : '060045782',
    'nip' : '199905192018121004',
    'tempatl' : 'Lampung',
    'tgllahir' : '19 Mei 1999',
    'pegawaiDJP' : 0,
    'alamat_hombase' : 'Jakarta',
    'eselon2' : 'Kantor Pusat DJP',
    'eselon3' : 'Subdit RKWPSD',
  };
  
  var _profil = {
    'nama' : 'Amran Imran',
    'lahir' : 'Lampung'
  };


  // final _url = 'http://10.0.2.2:8000/';
  final _url = 'https://pajakcengkareng.my.id/';

  final header = {
    'Content-Type': 'application/json',
    'Charset': 'utf-8'
  };
 
  Map<String, String> header2 = {
      'Content-Type': 'multipart/form-data',
  };

 

  void adduser(Map<String,Object> value) {
    this.id = value['id'];
    this.nip = value['nip'];
    this.password = value['password'];
    // this._detailUser = value; yang ini gamau jalan
    this.detailUser = {
      ...value
    };
    print(this.detailUser);
    notifyListeners();
  }

  Future<Map<String,Object>> tesLogin(Map<String,String> form) async {
    print('cek');
    final dataServer = await http.post(Uri.parse(this._url+'api/loginDuwit'),headers: this.header,body: json.encode(form));
    print(dataServer.statusCode);
    print(dataServer.headers);
    print(dataServer.body);

    if(dataServer.statusCode == 200) {
      final res = json.decode(dataServer.body) as Map<String,Object>;
      
      if(res['status']) {
          final prefs = await SharedPreferences.getInstance();
          final user = json.encode(res['data']);
          prefs.setString('userData',user);
          this.adduser(res['data']);
          notifyListeners();
          return {
            'status' : true,
            'text' : 'login sukses'
        };
      } else { 
        return {
          'status' : false,
          'text' : 'password salah!1'
        };
      }
    } else {
      return {
        'status' : false,
        'text' : 'request error'
      };
    }
    // final string = (this._currentUser['nip'] as String).trim();
    // print(string.substring(14,18));

    // print('$string  ${string.substring(string.length - 4,15)}');
   
  }


  Future<bool> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    final res = await prefs.clear();
    return res;
  }

  Future<bool> getReminder() async {
    if (this.reminder == null) {
      final req = await http.get(Uri.parse(this._url+'api/get-reminder'));
      print(req.headers);
      print(req.body);
      if(req.statusCode == 200) {
        final Map<String,Object> data = json.decode(req.body);
        if(data['status'] == 'oke') {
          final Map<String,Object> reminderString = data['data'];
          this.reminder = reminderString['value1'];
          print('get reminder okeee');
          // print(reminderString);
          print(this.reminder+ 'ini dari get reminder');
          notifyListeners();
          return true;
        } else {
          print('get reminder error');
          return false;
      
        }
      } else {
          print('get reminder okeee');
        return false;
      }
    } else {
      return false;
    }


  }

  Future<void> getPengeluaran() async {
     final req = await http.get(Uri.parse(this._url+'api/get-pengeluaran'));
     if(req.statusCode == 200) {
        final res = json.decode(req.body) as Map<String,Object>;
        final rincianPengeluaran = res['detail'] as List;
        this.detilPengeluaran = [
          ...rincianPengeluaran
        ];
        this.pengeluaranKas = res['total'] as int;
        notifyListeners(); 
        print('get pengeluaran okeeeee');

     } else {
       print('get pengeluaran error');
     }
  }

  Future<void> getPembayaran() async {
    final req = await http.get(Uri.parse('${this._url}api/get-pembayaran/${this.id}'));
    if(req.statusCode == 200) {

      final data = json.decode(req.body) as Map<String,Object>;
      print(data);
      // final bayar = data['rincian'] as List;
      this.rincianPembayaran = [
        ...data['rincian'] as List
      ];
      print(this.miscPembayaran);
      this.miscPembayaran['pegBayarBlnIni'] = data['pegByrBlnIni'];
      this.miscPembayaran['saldoTotal'] = data['saldoTotal'];
      this.miscPembayaran['totalBayarUser'] = data['total_bayar'];
      this.miscPembayaran['udahBayar'] = data['byr_bulan_ini'];
      this.miscPembayaran['totalByrBlnIni'] = data['totalByrBlnIni'];
      this.miscPembayaran['totalPegawai'] = data['totalPeg'];
      this.miscPembayaran['pegawaiDJP'] = data['pegawaiDJP'];
      this.tarifKas = data['tarifKas'];
      notifyListeners();
      // print(this.miscPembayaran);
    } else {
      print('getPembayaran error kode=' +req.headers.toString());
    }
  }


  Future<void> getPegawaiDJP() async {
    final req = await http.get(Uri.parse(this._url));
    if(req.statusCode == 200) {

    }
  }

  Future<void> getBelumBayar() async {
    print('banyaknya list blom bayar = '+this.pegawaiBelumBayar.length.toString());
    if(this.pegawaiBelumBayar.length == 0) {
      final req = await http.get(Uri.parse(this._url+'api/getBelumBayar'),headers: this.header);

      if(req.statusCode == 200) {
        final List data = await json.decode(req.body);
        // print(data);
        this.pegawaiBelumBayar = [
          ...data
        ];
        notifyListeners();
        print(this.pegawaiBelumBayar);
 
      }
    }
    
  }



  Future<bool> updateDataPeg(Map<String,String> formVal) async {
    // print(formVal);
    // return true;
    final req = await http.patch(Uri.parse(this._url+'api/update/'+this.id.toString()),headers: this.header,body: json.encode(formVal));
    final Map<String,Object>  data = json.decode(req.body);
    print(data);
    
    if(req.statusCode == 200 && data['status']) {
      
       final prefs = await SharedPreferences.getInstance();
          final user = json.encode(data['data']);
          prefs.setString('userData',user);
          this.adduser(data['data']);
          notifyListeners();
          return true;
    } else {
      return false;
    }
  }

  Future<void> getAllPegawai() async {
    if (this.AllGroupedPegawai.length == 0) {
      Map<String,Object> res;
      http.Response req = await http.get(Uri.parse(this._url+'api/get-allPegawai'),headers: this.header);
      try {
        res = json.decode(req.body);
      } catch(err) {
        print(err);
        while(res['data'] == null) {
        req = await http.get(Uri.parse(this._url+'api/get-allPegawai'),headers: this.header);
        res = json.decode(req.body);
      }
      }
      
      
     
      if(req.statusCode == 200) {
        print('get all pegawai jalan!');
        // print(req.body);
        Map<String,Object> data;
        while(data == null) {
          data = await jsonDecode(req.body); // JANGAN LUPA DIKASI AWAIT..KLO ENGGA NANTI KADANG2 ERROR ONVERT JSONNYA
        } 
        
        print(data['data']);
        this.AllGroupedPegawai = {
          ...data['data'] as Map
        };
        notifyListeners();
      
      }
    }

  }


  Future<bool> uploadTrf(String pembayaran, File image) async {
      // final req = await http.patch(Uri.parse(this._url+'api/upload/'+this.id.toString()),headers: this.header2,body: json.encode(formVal));
      final body = {
      'pembayaran' : pembayaran,
      'tarif' : this.tarifKas.toString()
    };
    

    var request = http.MultipartRequest('POST', Uri.parse('${this._url}api/upload/'+this.id.toString()))
      ..fields.addAll(body)
      ..headers.addAll(this.header2)
      ..files.add(await http.MultipartFile.fromPath('image', image.path));

    // request.fields['koordinat'] = koordinat;
    // request.fields['uraianLaporan'] = uraian;
    // request.files.add(multiPartFile);

    print(request.fields);
    final req = await request.send();
    final res = await http.Response.fromStream(req);
    if(res.statusCode == 200) {
      final decod = json.decode(res.body) as Map<String,Object>;
      final listBayar = decod['data'] as List;
      this.rincianPembayaran = [
        ...listBayar
      ];
      notifyListeners();
      return true;
    } else {
      return false;
    }
    // final data = json.decode(res.body) as Map<String,Object>;
  }



}