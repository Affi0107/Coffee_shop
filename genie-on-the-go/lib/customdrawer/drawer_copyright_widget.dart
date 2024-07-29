// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../developer_team/developer_team.dart';

class DrawerCopyrightWidget extends StatefulWidget {
  const DrawerCopyrightWidget({super.key});

  @override
  State<DrawerCopyrightWidget> createState() => _CopyrightState();
}

class _CopyrightState extends State<DrawerCopyrightWidget> {
  String _version = '';
  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.copyright_outlined,
              size: 20,
              color: Colors.grey.shade600,
            ),
            Text(
              '2024  V$_version',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeveloperTeam(),
                ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Meet The Team',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.play_arrow,
                size: 20,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
