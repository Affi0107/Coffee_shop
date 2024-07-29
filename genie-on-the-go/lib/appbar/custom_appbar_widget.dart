// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:project_2/appbar/bloc/appbar_bloc.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/constants/text_constants.dart';
import '../constants/color_constants.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppbarWidget extends ConsumerStatefulWidget {
  const CustomAppbarWidget({
    super.key,
    this.incart = true,
    this.coffee = true,
    required this.scaffoldKey,
  });
  final incart;
  final coffee;
  final scaffoldKey;
  @override
  ConsumerState<CustomAppbarWidget> createState() => _CustomAppbarWidgetState();
}

class _CustomAppbarWidgetState extends ConsumerState<CustomAppbarWidget> {
  bool _isNFCavailable = false;

  @override
  Widget build(BuildContext context) {
    var mainWidth = MediaQuery.of(context).size.width;
    final AppbarBloc appbarBloc = AppbarBloc();
    return BlocConsumer<AppbarBloc, AppbarState>(
      bloc: appbarBloc,
      listenWhen: (previous, current) => current is AppbarActionState,
      buildWhen: (previous, current) => current is! AppbarActionState,
      listener: (context, state) {
        if (state is AppbarDrawerClickedActionState) {
          Scaffold.of(context).openDrawer();
        } else if (state is AppbarLogoClickedActionState) {
          Navigator.pushReplacementNamed(context, "/home");
        } else if (state is AppbarCartClickedActionState) {
          Navigator.pushNamed(context, "/cart");
        }
      },
      builder: (BuildContext context, state) {
        final cartItemNos = widget.coffee == true
            ? ref.watch(CartProvider)
            : ref.watch(CargoProvider);
        final cartItemNo = cartItemNos.length;
        return Container(
          height: 100,
          width: mainWidth,
          decoration: BoxDecoration(
            // color: Color.fromARGB(255, 147, 188, 253),
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              Builder(builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    widget.scaffoldKey.currentState?.openDrawer();
                  },
                  child: Container(
                    width: (mainWidth / 3) - 50,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 17, 17, 19),
                                Color.fromARGB(255, 61, 62, 65)
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Iconify(
                          HeroiconsSolid.view_grid,
                          size: 12,
                          color: Color.fromARGB(255, 88, 91, 95),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              Container(
                width: (mainWidth / 3) + 30,
                // color: Colors.blue,
              ),
              Container(
                width: (mainWidth / 3) + 20,
                // color: Colors.green,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: _checkNFCStatus,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/mtap.jpg"),
                                    fit: BoxFit.fill),
                                gradient: _isNFCavailable == true
                                    ? LinearGradient(
                                        colors: [
                                            Color.fromARGB(255, 3, 37, 6),
                                            Colors.green.shade500,
                                          ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft)
                                    : LinearGradient(
                                        colors: [
                                            Color.fromARGB(255, 17, 17, 19),
                                            Color.fromARGB(255, 61, 62, 65)
                                          ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft)),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        widget.incart == true
                            ? InkWell(
                                onTap: () {
                                  widget.coffee == true
                                      ? Navigator.pushNamed(context, "/cart")
                                      : Navigator.pushNamed(
                                          context, "/cargocart");
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 17, 17, 19),
                                          Color.fromARGB(255, 61, 62, 65)
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: badges.Badge(
                                    badgeContent: Text(
                                      "$cartItemNo",
                                      style: TextStyle(color: badgeTextColor),
                                    ),
                                    position: badges.BadgePosition.topEnd(),
                                    badgeAnimation:
                                        badges.BadgeAnimation.scale(),
                                    showBadge: cartItemNo == 0 ? false : true,
                                    child: Center(
                                      child: Iconify(
                                        HeroiconsSolid.shopping_cart,
                                        size: 25,
                                        color: Color.fromARGB(255, 88, 91, 95),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 15,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _checkNFCStatus() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      setState(() {
        _isNFCavailable = isAvailable;
      });

      if (isAvailable) {
        _startNFCSession();
      } else {
        _showNoNFCDialog();
      }
    } catch (e) {
      debugPrint("error reading NFC: $e");
    }
  }

  void _startNFCSession() {
    print("NFC working");
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          title: Text(
            readyToScan,
            style: TextStyle(fontSize: 25),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(moveTheNFC, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Icon(
                Icons.nfc,
                size: 55,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(ok, style: TextStyle(fontSize: 18)),
            )
          ],
        );
      },
    );
    // NfcManager.instance.startSession(onDiscovered: _handleNFCDiscovered);
  }

  Future<void> _handleNFCDiscovered(NfcTag tag) async {
    // String tagId = tag.id;
    print("NFC Tag is discovered $tag");
  }

  void _showNoNFCDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: Text(dialogContent),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                ok,
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
        );
      },
    );
  }
}
