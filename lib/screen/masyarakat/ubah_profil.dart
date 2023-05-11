import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simop/services/users.dart';

class UbahProfilWidget extends StatefulWidget {
  const UbahProfilWidget({Key? key, required this.name, required this.nohp}) : super(key: key);

  final String name, nohp;

  @override
  _UbahProfilWidgetState createState() => _UbahProfilWidgetState();
}

class _UbahProfilWidgetState extends State<UbahProfilWidget> {
  final _nameController = TextEditingController();
  final _nohpController = TextEditingController();

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
    _nameController.text = widget.name;
    _nohpController.text = widget.nohp;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: Color(0xFF65A25E),
                            size: 24,
                          ),
                          onPressed: () async {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text('Ubah Profil',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // isian nama
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Container(
                      width: 300,
                      child: TextFormField(
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
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: null,
                      ),
                    ),
                  ),

                  // isian nama
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: Container(
                      width: 300,
                      child: TextFormField(
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
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_nameController.value.text != "" || _nohpController.value.text != "") {
                          await Users.updateUser(_nameController.value.text, _nohpController.value.text);
                        } else {
                          Get.defaultDialog(
                            backgroundColor: Colors.white,
                            middleText: "Nama / No. HP tidak boleh kosong!",
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
                      child: Text(
                        'Simpan',
                        style: Theme.of(context).textTheme.labelMedium,
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
