import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simop/screen/auth/login.dart';
import 'package:simop/screen/masyarakat/utama_masyarakat.dart';
import 'package:simop/services/auth.dart';
import 'package:simop/services/users.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    splashScreenStart();
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  splashScreenStart() {
    Timer(const Duration(seconds: 3), () async {
      var currentUser = Auth.getCurrentUser();
      if (currentUser) {
        var name = await Users.getNameUser();
        var email = await Users.getEmailUser();
        var nohp = await Users.getNohpUser();
        Get.off(UtamaMasyarakatWidget(name: name, email: email, nohp: nohp,));
      } else {
        Get.off(const LoginWidget());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFCFCFC),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/image/KotaSamarinda.png',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
              Image.asset(
                'assets/image/HeaderLogo.png',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
