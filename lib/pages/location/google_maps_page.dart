// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapsPage extends StatefulWidget {
//   const GoogleMapsPage({Key? key}) : super(key: key);

//   @override
//   State<GoogleMapsPage> createState() => _GoogleMapsPageState();
// }

// class _GoogleMapsPageState extends State<GoogleMapsPage> {
//   final Set<Marker> _markers = {};
//   final LatLng _currentPosition =
//       const LatLng(-6.863699998350391, 107.91467578695085);
//   @override
//   void initState() {
//     _markers.add(
//       Marker(
//         markerId: const MarkerId("-6.863699998350391, 107.91467578695085"),
//         position: _currentPosition,
//         icon: BitmapDescriptor.defaultMarker,
//       ),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Lokasi Bank Sampah"),
//       ),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: _currentPosition,
//           zoom: 14.0,
//         ),
//         markers: _markers,
//         onTap: (position) {
//           setState(() {
//             _markers.add(
//               Marker(
//                 markerId:
//                     MarkerId("${position.latitude}, ${position.longitude}"),
//                 icon: BitmapDescriptor.defaultMarker,
//                 position: position,
//               ),
//             );
//           });
//         },
//       ),
//     );
//   }
// }
