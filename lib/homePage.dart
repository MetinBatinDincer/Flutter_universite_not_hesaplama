import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color textColor= Color.fromARGB(255, 176, 204, 255);
  String? secilenNot;
  String? akts;
  bool listeGelsinMi = false;
  List<String> listAkts = [];
  List<String> listNot = [];
  List<String> listDersler = [];
  double agno = 0.0;
  double ort = 0.0;
  double toplamKredi = 0.0;
  double sonuc=0;
  void agnoHesaplamaFonk() {
     toplamKredi += double.parse(listAkts.last);
   ort = (agno * double.parse(listAkts.last) )+ort;
   sonuc=ort/toplamKredi;
   print(toplamKredi);
  }

  TextEditingController _controller = TextEditingController();
  String? metin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.indigo,
        title: Text(
          "Harf Notu Hesaplama",
          style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
      color: Color.fromARGB(255, 20, 52, 78),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 200,
                        child: TextField(
                          style: TextStyle(fontSize: 18),
                          controller: _controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: textColor,
                              filled: true,
                              hintText: "Ders adı giriniz.",hintStyle: TextStyle(fontSize: 18),)
                              
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //   if(akts!=null){
                          //     listAkts.add(akts.toString());
                          //     print(listAkts.last);
                          //   }
                          // if(secilenNot!=null){
                          //   listNot.add(secilenNot.toString());
                          //   print(listNot.last);
                          // }
                          // if(_controller.text!=null){
                          //  listDersler.add(_controller.text);
                          // print(listDersler.last);
                          // }
      
      
                         
      
      
                          if (akts != null &&
                              secilenNot != null &&
                              _controller.text != null) {
                            listAkts.add(akts.toString());
                            listNot.add(secilenNot.toString());
                            listDersler.add(_controller.text);
      
      
      
      
                            if (listNot != null) {
                              switch (listNot.last) {
                                case "AA":
                                  agno = 4;
                                  break;
                                case "BA":
                                  agno = 3.5;
                                  break;
                                case "BB":
                                  agno = 3;
                                  break;
                                case "CB":
                                  agno = 2.5;
                                  break;
                                case "CC":
                                  agno = 2;
                                  break;
                                case "DC":
                                  agno = 1.5;
                                  break;
                                case "DD":
                                  agno = 1;
                                  break;
                                case "FD":
                                  agno = 0.5;
                                  break;
                                case "FF":
                                  agno = 0;
                                  break;
                              }
                            }
      
                           agnoHesaplamaFonk();
                          }
      
                          if (akts != null &&
                              secilenNot != null &&
                              _controller.text != null&&listDersler!=null) {
                            setState(() {
                              listeGelsinMi = true;
                              secilenNot = null;
                              akts = null;
                             _controller.clear();
                              // _controller.clear();
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Ders ekle",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        style:
                            ElevatedButton.styleFrom(backgroundColor:  Colors.indigo.shade500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius:
                                BorderRadius.circular(10), // Kenar yarıçapı
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: dropDownButtonAkts("Akts: seç"),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius:
                                BorderRadius.circular(10), // Kenar yarıçapı
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: DropDownMenu("Notu: seç",),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red.shade900,
                          borderRadius:
                              BorderRadius.circular(10), // Kenar yarıçapı
                        ),
                        width: 100,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                              child: Text(
                            sonuc.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      
              SizedBox(
                height: 20,
              ),
              //  lisTileAdd("a", "b", "c"),
      
      // Liste görünürse ekrana eklenir
              Expanded(
                  child: SingleChildScrollView(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listDersler.length, // Listenin öğe sayısı
                    itemBuilder: (context, index) {
                      if (listeGelsinMi) {
                        return lisTileAdd(listDersler[index], listNot[index],
                            listAkts[index]);
                      }
                      ;
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Container lisTileAdd(String a, String b, String c) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
     decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10),  color: Color.fromARGB(255, 248, 237, 166)),
      child: Container(
       
        
        child: ListTile(
          
          title: Text(a,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
          subtitle: Text("Kredi: " + c,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          trailing: Text(b,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }

  DropdownButton<String?> dropDownButtonAkts(String a) {
    return DropdownButton(
      value: akts,
      items: [
        DropdownMenuItem<String>(
          child: Center(child: Text("Kredi: 1")),
          value: "1",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Kredi: 2")),
          value: "2",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Kredi: 3")),
          value: "3",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Kredi: 4")),
          value: "4",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Kredi: 5")),
          value: "5",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Kredi: 6")),
          value: "6",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Kredi: 7")),
          value: "7",
        ),
      ],
      onChanged: (String? kredi) {
        setState(() {
          akts = kredi;
        });
      },
      hint: Center(
        child: Text(
          akts != null ? akts! : a,
          textAlign: TextAlign.center,
        
        ),
      ),
    );
  }

  DropdownButton<String> DropDownMenu(String sec) {
    return DropdownButton<String>(
      value: secilenNot,
      items: [
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: AA")),
          value: "AA",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: BA")),
          value: "BA",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: BB")),
          value: "BB",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: CB")),
          value: "CB",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: CC")),
          value: "CC",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: DC")),
          value: "DC",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: DD")),
          value: "DD",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: FD")),
          value: "FD",
        ),
        DropdownMenuItem<String>(
          child: Center(child: Text("Not: FF")),
          value: "FF",
        ),
      ],
      onChanged: (String? not) {
        setState(() {
          secilenNot = not;
        });
      },
      hint: Center(
        child: Text(
          secilenNot != null ? secilenNot! : sec,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
