import 'package:flutter/material.dart';
import 'package:project_2/constants/color_constants.dart';

class Itemdesc extends StatefulWidget {
  const Itemdesc(
      {super.key,
      required this.quantity,
      required this.price,
      required this.incq,
      required this.name,
      required this.icon});
  final icon;
  final Function incq;
  final price;
  final name;
  final quantity;

  @override
  State<Itemdesc> createState() => _ItemdescState();
}

class _ItemdescState extends State<Itemdesc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Color.fromARGB(
            //     255, 17, 16, 16), // Color.fromARGB(255, 247, 235, 231),
            gradient: LinearGradient(
                colors: [cartLinearGrad1, cartLinearGrad2, cartLinearGrad3],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: cartboxshadow1,
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 3),
              )
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 105,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.icon),
              ),
              boxShadow: [
                BoxShadow(
                  color: cartboxshadow2,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: SizedBox(
              // color: Colors.green,
              width: 97,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: cartbuttoncolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${widget.price}",
                    style: TextStyle(
                      color: cartbuttoncolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //         showremove
          // //             ? remove
          SizedBox(
            width: 10,
          ),

          Container(
              child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 35,
                    decoration: BoxDecoration(
                        //   color: Color.fromARGB(255, 19, 18, 18),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        mouseCursor: SystemMouseCursors.click,
                        color: carticonbutton,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          size: 22,
                        )),
                  ),
                  Container(
                    //  color: Colors.red,
                    height: 30,
                    padding: EdgeInsets.fromLTRB(8, 6.8, 8, 0),
                    child: Text(
                      "${widget.quantity}",
                      style: TextStyle(
                          color: cartbuttoncolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                        color: carticonbutton,
                        onPressed: () {
                          widget.incq();
                        },
                        icon: Icon(
                          Icons.add,
                          size: 22,
                        )),
                  ),
                ],
              ),
            ],
          )),
        ]),
      ),
    );
  }
}
