import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_simop/services/auth.dart';
import 'package:pa_simop/services/users.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:pa_simop/screen/auth/daftar.dart';
import 'package:pa_simop/screen/masyarakat/utama_masyarakat.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFCFCFC),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: Color(0xFFFCFCFC),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/image/HeaderLogo.png',
                      width: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            toolbarHeight: double.infinity,
            elevation: 0,
          ),
        ),
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0, -1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GradientText(
                    'SIMOP',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                    colors: [Color(0xFFDA251D), Color(0xFF65A25E)],
                    gradientDirection: GradientDirection.rtl,
                    gradientType: GradientType.linear,
                  ),
                  Text('Sistem Informasi Manajemen \nObjek Pajak',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall),

                  // isian nama
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Container(
                      width: 300,
                      child: TextFormField(
                        controller: _emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintText: 'Masukan Email',
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                    ),
                  ),

                  // isian nama
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Container(
                      width: 300,
                      child: TextField(
                        obscureText: _isHidePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintText: 'Masukan Password',
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x2F1D2429),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isHidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color:
                                    _isHidePassword ? Colors.grey : Colors.blue,
                              ),
                              onPressed: () {
                                _togglePasswordVisibility();
                              }),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        var isLogin = await Auth.signInWithEmailAndPassword(
                            _emailController.value.text,
                            _passwordController.value.text);
                        if (isLogin) {
                          var name = await Users.getNameUser();
                          var email = await Users.getEmailUser();
                          var nohp = await Users.getNohpUser();
                          Get.off(UtamaMasyarakatWidget(name: name, email: email, nohp: nohp,));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        primary: Color(0xFF65A25E),
                      ),
                      child: Text('Masuk',
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(DaftarWidget());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        primary: Color(0xFFFCFCFC),
                      ),
                      child: Text('Daftar',
                          style: Theme.of(context).textTheme.labelSmall),
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
