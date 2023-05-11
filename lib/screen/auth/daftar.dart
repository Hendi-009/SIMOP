import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simop/services/auth.dart';
import 'package:simop/services/users.dart';

class DaftarWidget extends StatefulWidget {
  const DaftarWidget({Key? key}) : super(key: key);

  @override
  _DaftarWidgetState createState() => _DaftarWidgetState();
}

class _DaftarWidgetState extends State<DaftarWidget> {
  final _nameController = TextEditingController();
  final _nohpController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isHidePassword = true;
  bool _isHideConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isHideConfirmPassword = !_isHideConfirmPassword;
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Silahkan Isi Data Verifikasi',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  // isian nama
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Container(
                      width: 300,
                      child: TextField(
                        controller: _nameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintText: 'Isi Nama',
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
                        controller: _nohpController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'No.HP',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintText: 'Isi No.HP',
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
                                color: _isHidePassword ? Colors.grey : Colors.blue,
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
                  // isian nama
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Container(
                      width: 300,
                      child: TextField(
                        obscureText: _isHideConfirmPassword,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
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
                                _isHideConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: _isHideConfirmPassword ? Colors.grey : Colors.blue,
                              ),
                              onPressed: () {
                                _toggleConfirmPasswordVisibility();
                              }),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        ),
                        Text(
                          'Saya menyetujui syarat, ketentuan, dan privasi \nSIMOP',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_nameController.value.text.isEmpty) {
                          return Get.defaultDialog(
                              backgroundColor: Colors.white,
                              middleText: "Nama tidak boleh kosong!",
                              radius: 16,
                            );
                        }
                        if (_nohpController.value.text.isEmpty) {
                          return Get.defaultDialog(
                              backgroundColor: Colors.white,
                              middleText: "No. HP tidak boleh kosong!",
                              radius: 16,
                            );
                        }
                        if (_passwordController.value.text == _confirmPasswordController.value.text) {
                          var successRegister = await Auth.registerWithEmailAndPassword(_emailController.value.text, _passwordController.value.text);
                          if (successRegister) {
                            await Users.createUser(_emailController.value.text, _nameController.value.text, _nohpController.value.text);
                          }
                        } else {
                          Get.defaultDialog(
                            backgroundColor: Colors.white,
                            middleText: "Kedua password tidak sama!",
                            radius: 16,
                          );
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
                      child: Text('Daftar',
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        primary: Color(0xFFFCFCFC),
                      ),
                      child: Text('Kembali',
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
