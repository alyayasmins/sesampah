import 'package:flutter/material.dart';
import 'package:sesampah/pages/tukar_sampah/Pengantaran/dropOff.dart';
import 'package:sesampah/pages/tukar_sampah/Pengantaran/pickUp.dart';

class SubListCampuran extends StatefulWidget {
  const SubListCampuran({Key? key}) : super(key: key);

  @override
  State<SubListCampuran> createState() => _SubListCampuranState();
}

class _SubListCampuranState extends State<SubListCampuran> {
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
                },
              );
            },
          ),
          Container(
            height: 60,
            width: 360,
            child: ElevatedButton(
              onPressed: _value == true
                  ? () {
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
                                            Button(
                                              value: _radioGroupA,
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
