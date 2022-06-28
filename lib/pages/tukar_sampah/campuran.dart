import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/pages/tukar_sampah/Pengantaran/dropOff.dart';
import 'package:sesampah/pages/tukar_sampah/Pengantaran/pickUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubListCampuran extends StatefulWidget {
  const SubListCampuran({Key? key}) : super(key: key);

  @override
  State<SubListCampuran> createState() => _SubListCampuranState();
}

class _SubListCampuranState extends State<SubListCampuran> {
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
  List<dynamic> categoty = [];
  int _counter = 0;
  bool _value = false;

  int _radioGroupA = 0;
  void _handleRadioValueChanged(int? value) {
    setState(() {
      _radioGroupA = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CheckboxListTile(
            title: const Text("Sampah Campuran"),
            value: _value,
            onChanged: (value) {
              setState(
                () {
                  _value = value!;
                  List<dynamic>? category;
                  if (_value = true) {
                    categoty.add({
                      'category': 'Campuran',
                      'subCategory': 'Sampah Campuran',
                    });
                  } else {
                    categoty
                        .add({'category': '', 'subCategory': '', 'price': 0});
                  }
                  print(category);
                },
              );
            },
          ),
          Container(
            height: 60,
            width: 360,
            child: ElevatedButton(
              onPressed: _value == true
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
                                StatefulBuilder(builder: (BuildContext context,
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
                                                  fontWeight: FontWeight.bold,
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
                                                  fontWeight: FontWeight.bold,
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
                                                    docRef.set({
                                                      'delivery': 'menjemput'
                                                    }, SetOptions(merge: true));
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    PickUp(
                                                                      docRef1:
                                                                          docRef,
                                                                    )));
                                                  } else {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            'swapTrashes')
                                                        .add({
                                                      'delivery': 'Mengantarkan'
                                                    });
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    DropOff()));
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Lanjut',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff6FB2D2),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFFF0F4FD),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
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
    );
  }
}

class Button extends StatelessWidget {
  final int value;
  const Button({
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        onPressed: () {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PickUp()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DropOff()));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lanjut',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff6FB2D2),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFF0F4FD),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
