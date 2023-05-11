import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:simop/screen/auth/login.dart';
import 'package:simop/screen/masyarakat/nop_disimpan.dart';
import 'package:simop/services/auth.dart';
import 'package:simop/services/users.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'profil_masyarakat.dart';
import 'package:simop/screen/pbbp2/pbbp2.dart';
import 'package:simop/screen/pembayaran/riwayat_tagihan.dart';

class UtamaMasyarakatWidget extends StatelessWidget {
  UtamaMasyarakatWidget(
      {Key? key,
      required this.name,
      required this.email,
      required this.nohp})
      : super(key: key);

  final String name, email, nohp;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: Container(
        width: 120,
        child: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Navigasi',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Divider(
                thickness: 1,
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.solidBookmark,
                  color: Color(0xFF65A25E),
                  size: 24,
                ),
                onPressed: () {
                  Get.to(NOPDisimpanWidget());
                },
              ),
              Divider(
                thickness: 1,
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.history,
                  color: Color(0xFF65A25E),
                  size: 24,
                ),
                onPressed: () {
                  Get.to(RiwayatTagihanWidget());
                },
              ),
              Divider(
                thickness: 1,
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: Color(0xFF65A25E),
                  size: 24,
                ),
                onPressed: () {
                  Get.to(ProfilMasyarakatWidget(
                      name: name,
                      email: email,
                      nohp: nohp));
                },
              ),
              Divider(
                thickness: 1,
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.powerOff,
                  color: Color(0xFFDA251D),
                  size: 24,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            title: Text(
                              'Keluar?',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            contentPadding: EdgeInsets.all(20.0),
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    var success = await Auth.signOut();
                                    if (success) {
                                      Get.back();
                                      Get.off(LoginWidget());
                                    }
                                  },
                                  child: Text(
                                    'Keluar',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ))
                            ],
                          ));
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Color(0x2F1D2429),
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.alignJustify,
                              color: Color(0xFF111111),
                              size: 20,
                            ),
                            onPressed: () async {
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                          GradientText(
                            'SIMOP',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                            colors: [Color(0xFFDA251D), Color(0xFF65A25E)],
                            gradientDirection: GradientDirection.rtl,
                            gradientType: GradientType.linear,
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.solidBookmark,
                              color: Color(0xFF65A25E),
                              size: 20,
                            ),
                            onPressed: () {
                              Get.to(NOPDisimpanWidget());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Color(0x2F1D2429),
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                      'assets/image/KotaSamarinda.png',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder<String>(
                                    future: Users.getNameUser(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      );
                                    },
                                    initialData: "Loading...",
                                  ),
                                  FutureBuilder<String>(
                                    future: Users.getNohpUser(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      );
                                    },
                                    initialData: "Loading...",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Color(0x2F1D2429),
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidMap,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    Get.to(PajakPBBP2Widget());
                                  },
                                ),
                                Text(
                                  'PBB-P2',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidLightbulb,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'PPJ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.utensils,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Restoran',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidBookmark,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Reklame',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.hotel,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Hotel',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.parking,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Parkir',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.dice,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Hiburan',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.kiwiBird,
                                    color: Color(0xFF65A25E),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Walet',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Container(
                    width: double.infinity,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Color(0x2F1D2429),
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Text(
                              'Terbaru',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFFCFCFC),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7,
                                  color: Color(0x2F1D2429),
                                  offset: Offset(0, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
