// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:project_2/constants/color_constants.dart';
// import '../../constants/text_constants.dart';
// import '../model/json_model.dart';

// class AddOnBox extends StatelessWidget {
//   const AddOnBox({
//     super.key,
//     required this.call,
//     required this.addons,
//     required this.finalPrice,
//     required this.selectedindex,
//   });

//   final finalPrice;
//   final Function call;
//   final List<AddonModel> addons;
//   final int selectedindex;

//   @override
//   Widget build(BuildContext context) {
//     int? checkedIndex;
//     double totalPrice = finalPrice;
//     final sizeindex = selectedindex == 0
//         ? "Tall"
//         : selectedindex == 1
//             ? "Grande"
//             : "Venti";

//     return StatefulBuilder(builder: (context, setState) {
//       return Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Colors.blueGrey,
//             borderRadius: BorderRadius.circular(15),
//             border:
//                 Border.all(color: Color.fromARGB(255, 17, 17, 19), width: 3.5)),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: addons.length,
//               itemBuilder: (context, index) {
//                 var addon = addons[index];
//                 var addonsName = addon.addonsName;
//                 var price = addon.price;
//                 return Padding(
//                   padding: const EdgeInsets.all(3),
//                   child: CheckboxListTile(
//                     dense: true,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     tileColor: Colors.red,
//                     checkboxShape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4)),
//                     side: BorderSide(
//                         color: Color.fromARGB(255, 197, 120, 4), width: 2),
//                     value: checkedIndex == index,
//                     onChanged: (bool? newValue) {
//                       setState(() {
//                         if (newValue!) {
//                           checkedIndex = index;
//                           totalPrice = double.parse(
//                               (finalPrice + price).toStringAsFixed(2));
//                         } else {
//                           checkedIndex = null;
//                           totalPrice = finalPrice;
//                         }
//                         call(totalPrice);
//                       });
//                     },
//                     title: Text(
//                       addonsName,
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromRGBO(121, 74, 41, 1)),
//                     ),
//                     subtitle: Text(
//                       "\$ $price",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                     activeColor: Color.fromRGBO(168, 93, 38, 1),
//                     checkColor: Colors.white,
//                   ),
//                 );
//               },
//             ),
//             Divider(
//               color: Color.fromRGBO(143, 93, 58, 1),
//               thickness: 3,
//             ),
//             Container(
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                   color: Color.fromRGBO(143, 93, 58, 1),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Size",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                               letterSpacing: 0.8,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             sizeindex,
//                             style: TextStyle(
//                                 letterSpacing: 0.9,
//                                 fontSize: 18,
//                                 color: Colors.white),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 3),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Final Price",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                               letterSpacing: 0.8,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             "\$ $totalPrice",
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }
