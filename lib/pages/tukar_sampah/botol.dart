import 'package:flutter/material.dart';

class SubListBotol extends StatefulWidget {
  const SubListBotol({Key? key}) : super(key: key);

  @override
  _SubListBotolState createState() => _SubListBotolState();
}

class _SubListBotolState extends State<SubListBotol> {
  List<Map> availableSubBotol = [
    {"name": "Botol Orson", "isChecked": false},
    {"name": "Botol Kecap/saus ", "isChecked": false},
    {"name": "Botol Obat", "isChecked": false},
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
                children: availableSubBotol.map((botol) {
              return CheckboxListTile(
                  value: botol["isChecked"],
                  title: Text(
                    botol["name"],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (isActive) {
                    setState(() {
                      botol["isChecked"] = isActive;
                      _isActive = isActive!;
                    });
                  });
            }).toList()),
            Container(
              margin: const EdgeInsets.only(top: 370),
              height: 60,
              width: 388,
              child: ElevatedButton(
                onPressed: _isActive == false
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
                                    ),
                                  ]));
                            });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  onSurface: const Color(0xFF375969),
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
            )
          ]),
        ),
      ),
    );
  }
}
