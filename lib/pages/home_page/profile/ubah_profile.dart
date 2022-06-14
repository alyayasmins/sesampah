// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class EditProfileView extends StatefulWidget {
//   const EditProfileView({Key? key}) : super(key: key);

//   @override
//   _EditProfileViewState createState() => _EditProfileViewState();
// }

// class _EditProfileViewState extends State<EditProfileView> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void _handleSubmitted() {
//     final FormState? form = _formKey.currentState;
//     if (!form!.validate()) {
//       _autovalidate = true;
//       showInSnackBar('Please fix the errors in red before submitting.');
//     } else {
//       showInSnackBar('snackchat');
//       User.instance.first_name = firstName;
//       User.instance.last_name = lastName;

//       User.instance.save().then((result) {
//         print("Saving done: ${result}.");
//       });
//     }
//   }

//   final TextEditingController _firstNameController = TextEditingController();
//   String firstName = User.instance.first_name;
//   final TextEditingController _lastNameController = TextEditingController();
//   String lastName = User.instance.last_name;

//   @override
//   void initState() {
//     _firstNameController.text = firstName;
//     _lastNameController.text = lastName;
//     return super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//     final DateTime today = DateTime.now();

//     return Scaffold(
//         appBar: AppBar(title: const Text('Edit Profile'), actions: <Widget>[
//           Container(
//               padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 10.0),
//               child: MaterialButton(
//                 color: themeData.primaryColor,
//                 textColor: themeData.secondaryHeaderColor,
//                 child: const Text('Save'),
//                 onPressed: () {
//                   _handleSubmitted();
//                   Navigator.pop(context);
//                 },
//               ))
//         ]),
//         body: Form(
//             key: _formKey,
//             autovalidate: _autovalidate,
//             onWillPop: _warnUserAboutInvalidData,
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               children: <Widget>[
//                 Container(
//                   child: TextField(
//                     decoration: const InputDecoration(
//                         labelText: "First Name",
//                         hintText: "What do people call you?"),
//                     autocorrect: false,
//                     controller: _firstNameController,
//                     onChanged: (String value) {
//                       firstName = value;
//                     },
//                   ),
//                 ),
//                 Container(
//                   child: TextField(
//                     decoration: const InputDecoration(labelText: "Last Name"),
//                     autocorrect: false,
//                     controller: _lastNameController,
//                     onChanged: (String value) {
//                       lastName = value;
//                     },
//                   ),
//                 ),
//               ],
//             )));
//   }
// }
