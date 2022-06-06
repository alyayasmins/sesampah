import 'package:flutter/material.dart';

class TukarSampah extends StatefulWidget {
  const TukarSampah({Key? key}) : super(key: key);

  @override
  State<TukarSampah> createState() => _TukarSampahState();
}

class _TukarSampahState extends State<TukarSampah> {
  List<String> items = [
    "Kertas",
    "Botol",
    "Plastik",
    "Logam",
    "Minyak Jelantah",
    "Sampah Campuran"
  ];

  int current = 0;

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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 80,
                            height: 60,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? const Color(0xFFE8EEF6)
                                  : Colors.white,
                              borderRadius: current == index
                                  ? BorderRadius.circular(10)
                                  : BorderRadius.circular(10),
                              // border: current == index
                              //     ? Border.all(
                              //         color: Colors.deepPurpleAccent, width: 2)
                              //     : null,
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.black
                                        : Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        // Visibility(
                        //     visible: current == index,
                        //     child: Container(
                        //       width: 5,
                        //       height: 5,
                        //       decoration: const BoxDecoration(
                        //           color: Color.fromARGB(255, 7, 241, 105),
                        //           shape: BoxShape.circle),
                        //     ))
                      ],
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    items[current],
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
