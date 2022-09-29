import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/duwitProvider.dart';
import '../shared/Shared.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({ Key key }) : super(key: key);

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {

  final _formKey = GlobalKey<FormState>();
  var _isInit = false;
  var _isLoading = false;
  Map<String,Object> currentPeg = {
    'id' : 1,
    'nama' : 'Arman Irman',
    'nip' : '19685'
  };
  Map<String,String> _formVal = {

  };

// NOTEEEE!!!! _formVal HARUS DIINISASI DENGAN OBJECT KOSONGG
// KLO MISA CUMAN KY DIBAWAH
// Map<String,Object> _formVal; ----> NANTI BAKALAN KEBACA NULL DAN ERROR!!!!

  @override
    void didChangeDependencies() {
      if(!this._isInit) {
        final data = Provider.of<Duwit>(context,listen: false).detailUser;
        currentPeg['id'] = data['id'];
        currentPeg['nama'] = data['nama_pegawai'];
        currentPeg['nip'] = data['nip'];
      }
      print(currentPeg);
      this._isInit = true;
      super.didChangeDependencies();
    }

  Future<void> _submitForm() async {
    setState(() {
      this._isLoading = true;      
    });

    this._formKey.currentState.save();
    final req = await Provider.of<Duwit>(context,listen: false).updateDataPeg(this._formVal);
    print(this._formVal);
    if (req) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data berhasil di Update!',style: Shared.fontStyle2,),
          backgroundColor: Shared.primaryColor,
          duration: Duration(seconds: 2),
        )
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data GAGAL di Update!',style: Shared.fontStyle2,),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        )
      );
    }
    setState(() {
      this._isLoading = false;      
    }); 

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Shared.color5,
        child: ListView(
          // itemExtent: 50,

          padding: const EdgeInsets.all(20),
          // padding: const EdgeInsets.symmetric(vertical: 15),
          children: [
            const SizedBox(height: 50,),
            Text(currentPeg['nama'],style: Shared.fontStyle1.copyWith(fontSize: 20),textAlign: TextAlign.center),
            const SizedBox(height: 15,),
            Text(currentPeg['nip'],style: Shared.fontStyle2.copyWith(fontSize: 18,color: Colors.grey),textAlign: TextAlign.center),
            const SizedBox(height: 25,),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color : Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Form(
                key: this._formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height : 10),
                    Text('Form Update',style: Shared.fontStyle1.copyWith(fontSize: 15,)),
                    const SizedBox(height : 50),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'alamat sekarang',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'alamat_current' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'alamat homebase',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'alamat_hombase' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Instansi',
                        hintText: 'Jika DJP, isikan Unit eselon 2 anda',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'eselon2' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Eselon 3',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'eselon3' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Eselon 4',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'eselon4' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Jabatan',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'jabatan' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'tempat lahir',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'tempatl' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'tglahir' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'email' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Telepon',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'telepon' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nama Bank',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'namarek' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'No Rekening',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'norek' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Riwayat Penyakit',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Shared.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15) ,
                          borderSide: BorderSide(color: Shared.color3,) 
                        )
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                       if (val.isNotEmpty) {
                         this._formVal = {
                           ...this._formVal,
                           'penyakit' : val
                         };
                       }
                      },
                    ),
                    SizedBox(height: 25,),
                   ElevatedButton(
                      onPressed: () => this._submitForm(),
                      style: ElevatedButton.styleFrom(
                        primary: Shared.color2,
                        elevation: 5,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        
                      ),
                      child: this._isLoading ? CircularProgressIndicator(backgroundColor: Colors.white,) : Text(
                        'Update Data!',
                        style: Shared.fontStyle2,
                      ),
            )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),
             
          ]
        ),
      ),
    );
  }
}