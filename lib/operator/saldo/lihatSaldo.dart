import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/operator/homeOperator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LihatSaldo extends StatefulWidget {
  const LihatSaldo({Key? key}) : super(key: key);

  @override
  State<LihatSaldo> createState() => _LihatSaldoState();
}

class _LihatSaldoState extends State<LihatSaldo> {
  @override
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }

  userData() async {
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      docs = value.docs;
      setState(() {});
    });
  }

  List<DocumentSnapshot>? docs;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Saldo Pengguna",
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
      body: docs == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'No',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Saldo',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    docs!.length,
                    (i) => DataRow(
                      cells: [
                        DataCell(
                          Text(
                            (i + 1).toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            docs![i].get('fullName'),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            docs![i].get('balance').toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
