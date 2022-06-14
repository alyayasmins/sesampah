import 'package:flutter/material.dart';

class SubListJelantah extends StatefulWidget {
  const SubListJelantah({Key? key}) : super(key: key);

  @override
  State<SubListJelantah> createState() => _SubListJelantahState();
}

class _SubListJelantahState extends State<SubListJelantah> {
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
            title: const Text("Minyak Jelantah"),
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
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          )),
                          builder: (context) {
                            return Container(
                                margin: const EdgeInsets.all(25),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RadioListTile(
                                        value: 0,
                                        groupValue: _radioGroupA,
                                        onChanged: _handleRadioValueChanged,
                                        title: const Text("Menjemput"),
                                        subtitle: const Text(
                                            "Petugas akan menjemput sampahmu "),
                                        selected: _radioGroupA == 0,
                                      ),
                                      RadioListTile(
                                        value: 1,
                                        groupValue: _radioGroupA,
                                        onChanged: _handleRadioValueChanged,
                                        title: const Text("Mengantarkan"),
                                        subtitle: const Text(
                                            "Antar langsung sampahmu"),
                                        selected: _radioGroupA == 1,
                                      )
                                    ],
                                  ),
                                ]));
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
