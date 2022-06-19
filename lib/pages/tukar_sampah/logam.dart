import 'package:flutter/material.dart';

class SubListLogam extends StatefulWidget {
  const SubListLogam({Key? key}) : super(key: key);

  @override
  State<SubListLogam> createState() => _SubListLogamState();
}

class _SubListLogamState extends State<SubListLogam> {
  int _counter = 0;
  bool _value = false;
  bool _value2 = false;
  bool _value3 = false;

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
          Column(
            children: [
              CheckboxListTile(
                title: const Text("Kaleng/seng"),
                value: _value,
                onChanged: (value) {
                  setState(
                    () {
                      _value = value!;
                    },
                  );
                },
              ),
              CheckboxListTile(
                title: const Text("Besi Super"),
                value: _value2,
                onChanged: (value2) {
                  setState(
                    () {
                      _value2 = value2!;
                    },
                  );
                },
              ),
              CheckboxListTile(
                title: const Text("Almunium(Larutan Kaleng)"),
                value: _value3,
                onChanged: (value3) {
                  setState(
                    () {
                      _value3 = value3!;
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            height: 60,
            width: 360,
            child: ElevatedButton(
              onPressed: _value || _value2 || _value3 == true
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
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
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
                                          value: 0,
                                          groupValue: _radioGroupA,
                                          onChanged: (_) {
                                            setState(() {
                                              _radioGroupA = 0;
                                            });
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
                                          groupValue: _radioGroupA,
                                          onChanged: (_) {
                                            setState(() {
                                              _radioGroupA = 1;
                                            });
                                          },
                                          title: const Text(
                                            "Mengantarkan",
                                          ),
                                          subtitle: const Text(
                                              "Antar langsung sampahmu"),
                                          selected: _radioGroupA == 1,
                                        )
                                      ],
                                    ),
                                  ]));
                            });
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
