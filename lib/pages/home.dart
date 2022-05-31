import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Hai, Alya",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Icon(Icons.notifications)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Selamat datang di Sesampah",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 150,
            width: 375,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF6FB2D2),
            ),
            child: Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Saldo anda",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rp.100.000",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 130,
                      width: 110,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            shadowColor: Colors.grey,
                            elevation: 5,
                            primary: Colors.white),
                        onPressed: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/image/trash-can.png')),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Tukar Sampah",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 130,
                      width: 110,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            shadowColor: Colors.grey,
                            elevation: 5,
                            primary: Colors.white),
                        onPressed: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/coin.png')),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Tarik Saldo",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 130,
                      width: 110,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            shadowColor: Colors.grey,
                            elevation: 5,
                            primary: Colors.white),
                        onPressed: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/location.png')),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Lokasi Sampah",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Tukaran Terakhir",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: const Text(
                    //     "Lihat Semua",
                    //     style: TextStyle(
                    //       fontFamily: 'Poppins',
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w400,
                    //       color: Color(0XFF8F8F8F)
                    //     ),
                    //   )
                    // )
                  ]))
        ],
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: const Color(0XFF5C94AF),
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Beranda',
          ),
          FFNavigationBarItem(
            iconData: Icons.assignment,
            label: 'Pesanan',
            selectedBackgroundColor: const Color(0XFF5C94AF),
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Akun',
            selectedBackgroundColor: const Color(0XFF5C94AF),
          ),
        ],
      ),
    );
  }
}
