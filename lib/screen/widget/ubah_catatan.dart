import 'package:flutter/material.dart';

import 'package:simop/services/users_nop.dart';

class UbahCatatanWidget extends StatefulWidget {
  final String nop, catatan;

  UbahCatatanWidget({Key? key, required this.nop, required this.catatan})
      : super(key: key);

  @override
  State<UbahCatatanWidget> createState() => _UbahCatatanWidgetState();
}

class _UbahCatatanWidgetState extends State<UbahCatatanWidget> {
  final _catatanController = TextEditingController();

  @override
  Map<String, dynamic> saveState() {
    return {'catatan': _catatanController.value.text};
  }

  @override
  void initState() {
    super.initState();
    _catatanController.text = widget.catatan;
  }

  @override
  void restoreState(Map<String, dynamic> state) {
    setState(() {
      _catatanController.text = state['data'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 600,
        decoration: BoxDecoration(
          color: Color(0xFFFCFCFC),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: Container(
                    width: 350,
                    height: 200,
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Text(
                              'Ubah Catatan',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),

                          // isian nama
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Container(
                              width: 350,
                              child: TextFormField(
                                controller: _catatanController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Catatan',
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  hintText: 'Contoh: Rumah Lambung',
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyMedium,
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
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: null,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: ElevatedButton(
                              onPressed: () async {
                                await UsersNOP.updateUsersNOP(
                                    widget.nop, _catatanController.value.text);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                primary: Color(0xFF65A25E),
                              ),
                              child: Text('Simpan',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
