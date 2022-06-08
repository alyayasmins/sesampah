import 'package:flutter/material.dart';

class SubListKertas extends StatefulWidget {
  const SubListKertas({Key? key}) : super(key: key);

  @override
  _SubListKertasState createState() => _SubListKertasState();
}

class _SubListKertasState extends State<SubListKertas> {
  List<Map> availableSubKertas = [
    {"name": "Arsip", "isChecked": false},
    {"name": "Duplex", "isChecked": false},
    {"name": "Kardus", "isChecked": false},
  ];
  int _radioGroupA = 0;
  bool _isActive = true;
  void _handleRadioValueChanged(int? value) {
    setState(() {
      _radioGroupA = value!;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Sub Jenis Sampah',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                  children: availableSubKertas.map((kertas) {
                return CheckboxListTile(
                    value: kertas["isChecked"],
                    title: Text(
                      kertas["name"],
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (isActive) {
                      setState(() {
                        kertas["isChecked"] = isActive;
                        _isActive = isActive!;
                      });
                    });
              }).toList()),
              Container(
                margin: const EdgeInsets.only(top: 370),
                height: 60,
                width: 388,
                child: ElevatedButton(
                  child: const Text(
                    "Lanjut",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: _isActive == true
                      ? () {
                          setState(() {
                            _isActive = false;
                          });
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
                                      Container(
                                        child: Column(
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
                                              onChanged:
                                                  _handleRadioValueChanged,
                                              title: const Text("Menjemput"),
                                              subtitle: const Text(
                                                  "Petugas akan menjemput sampahmu "),
                                              selected: _radioGroupA == 0,
                                            ),
                                            RadioListTile(
                                              value: 1,
                                              groupValue: _radioGroupA,
                                              onChanged:
                                                  _handleRadioValueChanged,
                                              title: const Text("Mengantarkan"),
                                              subtitle: const Text(
                                                  "Antar langsung sampahmu"),
                                              selected: _radioGroupA == 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ]));
                              });
                        }
                      : null,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        } else {
                          return Colors.white;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
