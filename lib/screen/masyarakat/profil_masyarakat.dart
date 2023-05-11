import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pa_simop/services/auth.dart';
import 'package:pa_simop/services/users.dart';
import 'package:pa_simop/screen/auth/login.dart';
import 'package:pa_simop/screen/masyarakat/ubah_profil.dart';
import 'package:pa_simop/theme/theme_notifier.dart';

class ProfilMasyarakatWidget extends StatefulWidget {
  const ProfilMasyarakatWidget(
      {Key? key,
      required this.name,
      required this.email,
      required this.nohp})
      : super(key: key);

  final String name, email, nohp;

  @override
  _ProfilMasyarakatWidgetState createState() => _ProfilMasyarakatWidgetState();
}

class _ProfilMasyarakatWidgetState extends State<ProfilMasyarakatWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  bool _switch = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  String? fileName = "";

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      // theme: _switch ? _dark : _light,
      home: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
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
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.arrowLeft,
                                color: Color(0xFF65A25E),
                                size: 20,
                              ),
                              onPressed: () async {
                                Get.back();
                              },
                            ),
                            Text(
                              'Profil',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Switch(
                              value: _switch,
                              onChanged: (_newvalue) {
                                setState(() {
                                  _switch = _newvalue;
                                  themeNotifier.toggleTheme();
                                });
                              },
                              activeColor: Color(0xFF65A25E),
                              inactiveTrackColor: Color(0xFF777777),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                                'assets/image/KotaSamarinda.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 1),
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x2F1D2429),
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                widget.name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 1),
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x2F1D2429),
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                widget.email,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 1),
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x2F1D2429),
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'No.HP',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                widget.nohp,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(UbahProfilWidget(name:widget.name, nohp:widget.nohp));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        primary: Color(0xFF65A25E),
                      ),
                      child: Text(
                        'Ubah Profil',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                  title: Text(
                                    'Hapus Akun?',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  contentPadding: EdgeInsets.all(20.0),
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          var success = await Users.deleteUser();
                                          if (success) {
                                            success = await Auth.deleteUser();
                                            if (success) {
                                              Get.off(LoginWidget());
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Hapus',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ))
                                  ],
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        primary: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Text(
                        'Hapus Akun',
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
