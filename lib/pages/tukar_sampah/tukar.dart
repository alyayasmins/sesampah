import 'package:flutter/material.dart';
import 'package:sesampah/pages/home.dart';
import 'package:sesampah/pages/tukar_sampah/widget_helper.dart';

int catIndex = 0;

class TukarSampah extends StatefulWidget {
  const TukarSampah({Key? key}) : super(key: key);

  @override
  State<TukarSampah> createState() => _TukarSampahState();
}

class _TukarSampahState extends State<TukarSampah> {
  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Tukar Sampah",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage(
                          title: '',
                        )));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 150,
                        width: 120,
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 17),
                        child: ElevatedButton(
                            onPressed: () {
                              //catIndex = helper.categoryList
                            },
                            style: index == catIndex
                                ? WidgetHelper().btnCategoryStyle(true)
                                : WidgetHelper().btnCategoryStyle(false),
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Icon(
                                        Icons.insert_drive_file,
                                        color: Color(0XFF6FB2D2),
                                      ),
                                      SizedBox(
                                        height: 55,
                                      ),
                                      Text(
                                        "Kertas",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF6FB2D2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 150,
                        width: 120,
                        margin:
                            const EdgeInsets.only(left: 2, right: 2, top: 17),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: index == catIndex
                                ? WidgetHelper().btnCategoryStyle(true)
                                : WidgetHelper().btnCategoryStyle(false),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 15,
                                ),
                                Icon(Icons.insert_drive_file,
                                    color: Color(0XFF6FB2D2)),
                                SizedBox(
                                  height: 55,
                                ),
                                Text(
                                  "Kertas",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF6FB2D2),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 150,
                        width: 120,
                        margin:
                            const EdgeInsets.only(left: 15, right: 2, top: 17),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: index == catIndex
                                ? WidgetHelper().btnCategoryStyle(true)
                                : WidgetHelper().btnCategoryStyle(false),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 15,
                                ),
                                Icon(Icons.insert_drive_file,
                                    color: Color(0XFF6FB2D2)),
                                SizedBox(
                                  height: 55,
                                ),
                                Text(
                                  "Kertas",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF6FB2D2),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 150,
                        width: 120,
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 17),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: index == catIndex
                                ? WidgetHelper().btnCategoryStyle(true)
                                : WidgetHelper().btnCategoryStyle(false),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 15,
                                ),
                                Icon(Icons.insert_drive_file,
                                    color: Color(0XFF6FB2D2)),
                                SizedBox(
                                  height: 55,
                                ),
                                Text(
                                  "Kertas",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF6FB2D2),
                                  ),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
