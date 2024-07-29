// import 'package:flutter/material.dart';

// class AddressPage extends StatefulWidget {
//   @override
//   _AddressPageState createState() => _AddressPageState();
// }

// class _AddressPageState extends State<AddressPage> {
//   final _formKey = GlobalKey<FormState>();

//   String _addressLine1 = '';
//   String _addressLine2 = '';
//   String _pinCode = '';
//   String _city = '';
//   String _landmark = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Address App'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Address Line 1'),
//                   onSaved: (value) {
//                     _addressLine1 = value!;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Address Line 2'),
//                   onSaved: (value) {
//                     _addressLine2 = value!;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Pin Code'),
//                   onSaved: (value) {
//                     _pinCode = value!;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'City'),
//                   onSaved: (value) {
//                     _city = value!;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Landmark'),
//                   onSaved: (value) {
//                     _landmark = value!;
//                   },
//                 ),
//                 SizedBox(height: 24.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Validate returns true if the form is valid, or false otherwise.
//                     if (_formKey.currentState!.validate()) {
//                       // If the form is valid, display a snackbar. In the real world,
//                       // you'd often call a server or save the information in a database.
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Processing Data'),
//                         ),
//                       );
//                     }
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
