import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesampah/pages/home_page/profile/profile.dart';

class AturAlamat extends StatefulWidget {
  final DocumentSnapshot doc;
  const AturAlamat({Key? key, required this.doc}) : super(key: key);

  @override
  State<AturAlamat> createState() => _AturAlamatState();
}

class _AturAlamatState extends State<AturAlamat> {
  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    addressController = TextEditingController(text: widget.doc.get('address'));
    // TODO: implement initState
    super.initState();
  }

  String? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Atur Alamat",
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
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Form(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      controller: addressController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  widget.doc.reference.update({
                    'address': addressController.text,
                  });
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF375969),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Simpan",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
