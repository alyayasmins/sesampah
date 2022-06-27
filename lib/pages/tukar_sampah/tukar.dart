import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:sesampah/pages/home_page/bottom_bar.dart';
import 'package:sesampah/pages/tukar_sampah/campuran.dart';
import 'package:sesampah/pages/tukar_sampah/jelantah.dart';
import 'package:sesampah/pages/tukar_sampah/kertas.dart';
import 'package:sesampah/pages/tukar_sampah/logam.dart';
import 'package:sesampah/pages/tukar_sampah/plastik.dart';
import 'botol.dart';

class TukarSampah extends StatefulWidget {
  const TukarSampah({Key? key}) : super(key: key);

  @override
  State<TukarSampah> createState() => _TukarSampahState();
}

class _TukarSampahState extends State<TukarSampah>
    with SingleTickerProviderStateMixin {
  List<String> items = [
    "Kertas",
    "Botol",
    "Plastik",
    "Logam",
    "Minyak Jelantah",
    "Sampah Campuran"
  ];

  int current = 0;
  get tabcontrol => null;

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: DefaultTabController(
        length: 6,
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: const BoxConstraints.expand(height: 60),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabcontrol,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  isScrollable: true,
                  unselectedLabelColor: const Color(0xff6FB2D2),
                  indicator: const BubbleTabIndicator(
                    indicatorHeight: 52,
                    indicatorColor: Color(0xffE8EEF6),
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    indicatorRadius: 5,
                  ),
                  tabs: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Kertas',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Botol',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Plastik',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Logam',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Jelantah',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(255, 228, 221, 221))),
                      child: const Text(
                        'Campuran',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff6FB2D2)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sub Jenis Sampah",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  SubListKertas(),
                  SubListBotol(),
                  SubListPlastik(),
                  SubListLogam(),
                  SubListJelantah(),
                  SubListCampuran(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
