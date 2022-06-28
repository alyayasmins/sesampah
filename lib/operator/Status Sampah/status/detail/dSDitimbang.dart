import 'package:flutter/material.dart';
import 'package:sesampah/operator/Status%20Sampah/status/detail/Timbangan.dart';

class dsDitimbang extends StatefulWidget {
  final String docId;
  final String userId;
  final String fullName;
  final String delivery;
  final List trashes;

  const dsDitimbang({
    Key? key,
    required this.docId,
    required this.userId,
    required this.fullName,
    required this.delivery,
    required this.trashes,
  }) : super(key: key);

  @override
  State<dsDitimbang> createState() => _dsDitimbangState();
}

class _dsDitimbangState extends State<dsDitimbang> {
  void _showNotification() {}
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
                          widget.fullName,
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
                          widget.delivery,
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
                    Column(
                      children: List.generate(widget.trashes.length, (index) {
                        print(widget.trashes.length);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.trashes[index]['subCategory'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              widget.trashes[index]['price'].toString() + '/kg',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    SizedBox(
                      height: 5,
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
                          "Sampah Sedang Ditimbang",
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
                    Text(
                      "Keterangan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Tunggu notifikasi sampah yang telah selesai di timbang",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCD7B2E)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: SizedBox(
                        height: 60,
                        width: 388,
                        child: ElevatedButton(
                          onPressed: () {
                            AlertDialog alert = AlertDialog(
                              title: const Text(
                                "Konfirmasi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                              ),
                              content: const Text(
                                "Kirim notifikasi ke pengguna",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff757575)),
                              ),
                              actions: [
                                Center(
                                  child: OutlinedButton(
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xff6FB2D2)),
                                    ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Timbangan(
                                          userId: widget.userId,
                                          docId: widget.docId,
                                          fullName: widget.fullName,
                                          delivery: widget.delivery,
                                          trashes: widget.trashes,
                                        ),
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        width: 2.0,
                                        color: Color(0xff6FB2D2),
                                      ),
                                      shape: const StadiumBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
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
