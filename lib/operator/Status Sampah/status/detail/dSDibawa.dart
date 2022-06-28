import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dsDibawa extends StatefulWidget {
  List? trash;
  String? location;
  String? name;
  String? delivery;
  String docId;
  dsDibawa({
    Key? key,
    required this.trash,
    required this.delivery,
    required this.location,
    required this.name,
    required this.docId,
  }) : super(key: key);

  @override
  State<dsDibawa> createState() => _dsDibawaState();
}

class _dsDibawaState extends State<dsDibawa> {
  void initState() {
    // TODO: implement initState
    dataUser();
    userData();
    super.initState();
  }

  dataUser() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = shared.getString('uid');
    await FirebaseFirestore.instance
        .collection('swapTrashes')
        .doc(uid)
        .get()
        .then((value) {
      setState(() {});
    });
  }

  userData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    uid = shared.getString('uid');
    await FirebaseFirestore.instance
        .collection('locations')
        .doc(uid)
        .get()
        .then((value) {
      address = value.get('address');
      setState(() {});
    });
  }

  String? address;
  String? uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Detail",
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
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nama Pengguna",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.name!,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pengantaran",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.delivery!,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Pesanan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: List.generate(widget.trash!.length, (index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.trash![index]['subCategory'],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.trash![index]['price'].toString() +
                                    '/kg',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Sampah Segera Diambil",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF43936C)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              "Lokasi Penjemputan",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF375969),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            widget.location!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: SizedBox(
                        height: 60,
                        width: 388,
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('swapTrashes')
                                .doc(widget.docId)
                                .update(
                              {'status': "Ditimbang"},
                            );

                            Navigator.pop(context);
                          },
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
