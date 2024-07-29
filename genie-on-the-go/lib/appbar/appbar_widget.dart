// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:project_2/appbar/bloc/appbar_bloc.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';

import 'package:badges/badges.dart' as badges;

class AppbarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppbarWidget({super.key, this.incart = true, this.coffee = true});

  final incart;
  final coffee;

  @override
  ConsumerState<AppbarWidget> createState() => _AppbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppbarWidgetState extends ConsumerState<AppbarWidget> {
  bool _isNFCavailable = false;

  @override
  Widget build(BuildContext context) {
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
      builder: (context, state) {
        final cartItemNos = widget.coffee == true
            ? ref.watch(CartProvider)
            : ref.watch(CargoProvider);
        final cartItemNo = cartItemNos.length;

        return AppBar(
          // automaticallyImplyLeading: false,
          // // flexibleSpace: Image.asset(
          // //   "assets/images/appbarbg4.jpg",
          // //   fit: BoxFit.cover,
          // // ),
          //    backgroundColor: Colors.black,
          backgroundColor: Colors.grey.shade900,
          elevation: 0,
          title: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: circleavatarbgcolor,
                  backgroundImage: AssetImage("assets/images/logo1.png"),
                  radius: 18,
                ),
              ],
            ),
          ),
          leading: Builder(builder: (BuildContext context) {
            return SizedBox(
                child: InkWell(
              onTap: () {
                // Scaffold.of(context).openDrawer();
              },
              child: Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(7),
                height: 35,
                decoration: BoxDecoration(
                  // color: Color(0xFF1F242C),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Iconify(
                  HeroiconsSolid.view_grid,
                  color: Color(0xFF4D4F52),
                ),
              ),
            ));
          }),
          actions: [
            InkWell(
              onTap: _checkNFCStatus,
              child:
                  // CircleAvatar(
                  // backgroundColor: _isNFCavailable == true
                  //     ? nfcCircleAvatarAvailableColor
                  //     : nfcCircleAvatarNotAvailableColor,
                  //   radius: 14,
                  //   child: Icon(
                  //     Icons.nfc_rounded,
                  //     size: 22,
                  //     color: nfcIconColor,
                  //   ),
                  // ),
                  Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(7),
                height: 30,
                width: 42,
                decoration: BoxDecoration(
                  // color: Color(0xFF1F242C),
                  // color: Color.fromARGB(255, 20, 25, 33),
                  color: _isNFCavailable == true
                      ? nfcCircleAvatarAvailableColor
                      : nfcCircleAvatarNotAvailableColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Iconify(
                  HeroiconsSolid.shopping_cart,
                  color: Color(0xFF4D4F52),
                ),
              ),
            ),
            widget.incart == true
                ?
                // IconButton(
                //     onPressed: () {
                //       widget.coffee == true
                //           ? Navigator.pushNamed(context, "/cart")
                //           : Navigator.pushNamed(context, "/cargocart");
                //     },
                // icon: badges.Badge(
                //   badgeContent: Text(
                //     "$cartItemNo",
                //     // style: TextStyle(color: badgeTextColor),
                //   ),
                //   badgeAnimation: badges.BadgeAnimation.scale(),
                //   showBadge: cartItemNo == 0 ? false : true,
                //   child: Icon(Icons.shopping_cart),
                // ),
                //     color: cartIconColor,
                //     iconSize: 27,
                //   )
                InkWell(
                    onTap: () {
                      widget.coffee == true
                          ? Navigator.pushNamed(context, "/cart")
                          : Navigator.pushNamed(context, "/cargocart");
                    },
                    child: Container(
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.all(9),
                        height: 30,
                        width: 42,
                        decoration: BoxDecoration(
                          // color: Color(0xFF1F242C),
                          // color: Color.fromARGB(255, 20, 25, 33),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: badges.Badge(
                          badgeContent: Text(
                            "$cartItemNo",
                            style: TextStyle(color: badgeTextColor),
                          ),
                          badgeAnimation: badges.BadgeAnimation.scale(),
                          showBadge: cartItemNo == 0 ? false : true,
                          child: Iconify(
                            HeroiconsSolid.shopping_cart,
                            color: Color(0xFF4D4F52),
                          ),
                        )),
                  )
                : SizedBox(
                    width: 15,
                  ),
          ],
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
