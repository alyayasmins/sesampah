import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:sesampah/pages/tukar_sampah/Pengantaran/dropOff.dart';
import 'package:sesampah/pages/tukar_sampah/Pengantaran/pickUp.dart';
import 'package:sesampah/pages/tukar_sampah/jelantah.dart';
import 'package:sesampah/pages/tukar_sampah/kertas.dart';
import 'package:sesampah/pages/tukar_sampah/logam.dart';
import 'package:sesampah/pages/tukar_sampah/plastik.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'botol.dart';

class TukarSampah extends StatefulWidget {
  const TukarSampah({Key? key}) : super(key: key);

  @override
  State<TukarSampah> createState() => _TukarSampahState();
}

class _TukarSampahState extends State<TukarSampah>
    with SingleTickerProviderStateMixin {
  List<String> items = [
    "Kertas",
    "Botol",
    "Plastik",
    "Logam",
    "Minyak Jelantah",
    "Sampah Campuran"
  ];
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = shared.getString('uid');
  }

  String? uid;
  int current = 0;
  bool _value = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;
  bool _value7 = false;
  bool _value8 = false;
  bool _value9 = false;
  bool _value10 = false;
  bool _value11 = false;
  bool _value12 = false;
  bool _value13 = false;
  bool _value14 = false;
  bool _value15 = false;
  bool _value16 = false;

  List<dynamic> categoty = [];

  int _radioGroupA = 0;
  void _handleRadioValueChanged(int? value) {
    setState(() {
      _radioGroupA = value!;
    });
  }

  get tabcontrol => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Tukar Sampah",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: DefaultTabController(
        length: 5,
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: const BoxConstraints.expand(height: 60),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabcontrol,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  isScrollable: true,
                  unselectedLabelColor: const Color(0xff6FB2D2),
                  indicator: const BubbleTabIndicator(
                    indicatorHeight: 52,
                    indicatorColor: Color(0xffE8EEF6),
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    indicatorRadius: 5,
                  ),
                  tabs: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Kertas',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Botol',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Plastik',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Logam',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Jelantah',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sub Jenis Sampah",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arsip",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "750/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value!;
                              List<dynamic>? category;
                              if (_value = true) {
                                categoty.add({
                                  'category': 'kertas',
                                  'subCategory': 'Arsip',
                                  'price': 750
                                });
                              }
                              print(category);
                            },
                          );
                          ;
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Duplex",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "250/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value2,
                        onChanged: (value2) {
                          setState(
                            () {
                              _value2 = value2!;
                              List<dynamic>? category;
                              if (_value2 = true) {
                                categoty.add({
                                  'category': 'kertas',
                                  'subCategory': 'Duplex',
                                  'price': 250
                                });
                              }
                              print(category);
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kardus",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "2000/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value3,
                        onChanged: (value3) {
                          setState(
                            () {
                              _value3 = value3!;
                              List<dynamic>? category;
                              if (_value3 = true) {
                                categoty.add({
                                  'category': 'kertas',
                                  'subCategory': 'Kardus',
                                  'price': 2000
                                });
                              } else {
                                categoty.add({
                                  'category': '',
                                  'subCategory': '',
                                  'price': 0
                                });
                              }
                              ;
                              print(categoty);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Botol Orson",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "100/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value4,
                        onChanged: (value4) {
                          setState(
                            () {
                              _value4 = value4!;
                              List<dynamic>? category;
                              if (_value4 = true) {
                                categoty.add({
                                  'category': 'Botol',
                                  'subCategory': 'Botol Orson',
                                  'price': 100
                                });
                              }
                              print(category);
                            },
                          );
                          ;
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Botol Kecap/saus",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "250/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value5,
                        onChanged: (value5) {
                          setState(
                            () {
                              _value5 = value5!;
                              List<dynamic>? category;
                              if (_value5 = true) {
                                categoty.add({
                                  'category': 'Botol',
                                  'subCategory': 'Botol Kecap/saus',
                                  'price': 250
                                });
                              }
                              print(category);
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Botol Obat",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "25/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value6,
                        onChanged: (value6) {
                          setState(
                            () {
                              _value6 = value6!;
                              List<dynamic>? category;
                              if (_value6 = true) {
                                categoty.add({
                                  'category': 'Botol',
                                  'subCategory': 'Botol Obat',
                                  'price': 25
                                });
                              } else {
                                categoty.add({
                                  'category': '',
                                  'subCategory': '',
                                  'price': 0
                                });
                              }
                              ;
                              print(categoty);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Plastik Bahan Mainan",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "1500/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value7,
                        onChanged: (value7) {
                          setState(
                            () {
                              _value7 = value7!;
                              List<dynamic>? category;
                              if (_value7 = true) {
                                categoty.add({
                                  'category': 'Plastik',
                                  'subCategory': 'Plastik Bahan Mainan',
                                  'price': 1500
                                });
                              }
                              print(category);
                            },
                          );
                          ;
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Plastik Minuman",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "2000/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value8,
                        onChanged: (value8) {
                          setState(
                            () {
                              _value8 = value8!;
                              List<dynamic>? category;
                              if (_value8 = true) {
                                categoty.add({
                                  'category': 'Plastik',
                                  'subCategory': 'Plastik Minuman',
                                  'price': 2000
                                });
                              }
                              print(category);
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Plastik Campuran",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "1000/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value9,
                        onChanged: (value9) {
                          setState(
                            () {
                              _value9 = value9!;
                              List<dynamic>? category;
                              if (_value9 = true) {
                                categoty.add({
                                  'category': 'Plastik',
                                  'subCategory': 'Plastik Campuran',
                                  'price': 1000
                                });
                              }
                              print(category);
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Plastik Kemasan",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "200/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value10,
                        onChanged: (value10) {
                          setState(
                            () {
                              _value10 = value10!;
                              List<dynamic>? category;
                              if (_value10 = true) {
                                categoty.add({
                                  'category': 'Plastik',
                                  'subCategory': 'Plastik Kemasan',
                                  'price': 200
                                });
                              }
                              print(category);
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Plastik Bening",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "250/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value11,
                        onChanged: (value11) {
                          setState(
                            () {
                              _value11 = value11!;
                              List<dynamic>? category;
                              if (_value11 = true) {
                                categoty.add({
                                  'category': 'Plastik',
                                  'subCategory': 'Plastik Bening',
                                  'price': 250
                                });
                              }
                              print(category);
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Galon (per biji)",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "3000/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value12,
                        onChanged: (value12) {
                          setState(
                            () {
                              _value12 = value12!;
                              List<dynamic>? category;
                              if (_value12 = true) {
                                categoty.add({
                                  'category': 'Plastik',
                                  'subCategory': 'Galon (per biji) ',
                                  'price': 3000
                                });
                              } else {
                                categoty.add({
                                  'category': '',
                                  'subCategory': '',
                                  'price': 0
                                });
                              }
                              ;
                              print(categoty);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kaleng/seng",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "750/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value13,
                        onChanged: (value13) {
                          setState(
                            () {
                              _value13 = value13!;
                              List<dynamic>? category;
                              if (_value13 = true) {
                                categoty.add({
                                  'category': 'Logam',
                                  'subCategory': 'Kaleng/seng',
                                  'price': 750
                                });
                              }
                              print(category);
                            },
                          );
                          ;
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Besi Super",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "2000/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value14,
                        onChanged: (value14) {
                          setState(
                            () {
                              _value14 = value14!;
                              List<dynamic>? category;
                              if (_value14 = true) {
                                categoty.add({
                                  'category': 'Logam',
                                  'subCategory': 'Besi Super',
                                  'price': 2000
                                });
                              }
                              print(category);
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Almunium(Larutan Kaleng)",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "2500/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value15,
                        onChanged: (value15) {
                          setState(
                            () {
                              _value15 = value15!;
                              List<dynamic>? category;
                              if (_value15 = true) {
                                categoty.add({
                                  'category': 'Logam',
                                  'subCategory': 'Almunium(Larutan Kaleng)',
                                  'price': 20500
                                });
                              } else {
                                categoty.add({
                                  'category': '',
                                  'subCategory': '',
                                  'price': 0
                                });
                              }
                              ;
                              print(categoty);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Minyak Jelantah",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "2500/kg",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        value: _value16,
                        onChanged: (value16) {
                          setState(
                            () {
                              _value16 = value16!;
                              List<dynamic>? category;
                              if (_value16 = true) {
                                categoty.add({
                                  'category': 'Jelantah',
                                  'subCategory': 'Minyak Jelantah',
                                  'price': 2500
                                });
                              } else {
                                categoty.add({
                                  'category': '',
                                  'subCategory': '',
                                  'price': 0
                                });
                              }
                              print(category);
                            },
                          );
                          ;
                        },
                      ),
                    ],
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 360,
                    child: ElevatedButton(
                      onPressed: _value ||
                              _value2 ||
                              _value3 ||
                              _value4 ||
                              _value5 ||
                              _value6 ||
                              _value7 ||
                              _value8 ||
                              _value9 ||
                              _value10 ||
                              _value11 ||
                              _value12 ||
                              _value13 ||
                              _value14 ||
                              _value15 ||
                              _value16 == true
                          ? () async {
                              print(categoty);
                              DocumentReference<Map<String, dynamic>> docRef =
                                  await FirebaseFirestore.instance
                                      .collection('swapTrashes')
                                      .add({
                                'userId': uid,
                                'status': 'Belum Diproses',
                                'createdAt': Timestamp.now(),
                                'trash': categoty
                              });
                              print(docRef);
                              showModalBottomSheet(
                                  backgroundColor: const Color(0xff6FB2D2),
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  )),
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return Container(
                                              margin: const EdgeInsets.all(30),
                                              child: Column(children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Pilih Pengantaran Sampah",
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xffF0F4FD),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    RadioListTile(
                                                      activeColor: Colors.white,
                                                      value: 0,
                                                      groupValue: _radioGroupA,
                                                      onChanged: (_) {
                                                        setState(
                                                          () {
                                                            _radioGroupA = 0;
                                                          },
                                                        );
                                                      },
                                                      title: const Text(
                                                        "Menjemput",
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      subtitle: const Text(
                                                          "Petugas akan menjemput sampahmu "),
                                                      selected: _radioGroupA == 0,
                                                    ),
                                                    RadioListTile(
                                                      value: 1,
                                                      activeColor: Colors.white,
                                                      groupValue: _radioGroupA,
                                                      onChanged: (_) {
                                                        setState(() {
                                                          _radioGroupA = 1;
                                                        });
                                                      },
                                                      title: const Text(
                                                        "Mengantarkan",
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      subtitle: const Text(
                                                          "Antar langsung sampahmu"),
                                                      selected: _radioGroupA == 1,
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.9,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          if (_radioGroupA == 0) {
                                                            docRef.set(
                                                                {
                                                                  'delivery':
                                                                      'Menjemput'
                                                                },
                                                                SetOptions(
                                                                    merge: true));
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PickUp(
                                                                  docRef1: docRef,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            docRef.set(
                                                                {
                                                                  'delivery':
                                                                      'Mengantarkan'
                                                                },
                                                                SetOptions(
                                                                    merge: true));
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    DropOff(
                                                                        docRef2:
                                                                            docRef),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Lanjut',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                color: Color(
                                                                    0xff6FB2D2),
                                                              ),
                                                              textAlign:
                                                                  TextAlign.center,
                                                            ),
                                                          ],
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Color(0xFFF0F4FD),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ]));
                                        }),
                                      ],
                                    );
                                  });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF375969),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "Lanjut",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
