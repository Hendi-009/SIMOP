import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:simop/services/riwayat_tagihan.dart';
import 'package:simop/services/tagihan.dart';

import 'pembayaran_tagihan.dart';

class TagihanPajakWidget extends StatefulWidget {
  const TagihanPajakWidget(
    {Key? key, 
    required this.nop,
    required this.pokok, 
    required this.denda,
    required this.tahun}) 
    : super(key: key);

  final String nop, pokok, denda, tahun;

  @override
  _TagihanPajakWidgetState createState() => _TagihanPajakWidgetState();
}

class _TagihanPajakWidgetState extends State<TagihanPajakWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final List<String> items = [
    'VA Bankaltimtara',
    'QRIS Bankaltimtara',
  ];
  String? selectedValue;

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFCFCFC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBar(
          backgroundColor: Color(0xFFFCFCFC),
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
                    child: Text('Tagihan',
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pokok',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              widget.pokok,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Denda',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              widget.denda,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              (int.parse(widget.pokok) + int.parse(widget.denda)).toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Metode \nPembayaran',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Text(
                                  'Jenis Pembayaran',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: 160,
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    color: Color(0xFFFCFCFC),
                                  ),
                                  elevation: 0,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (selectedValue == "VA Bankaltimtara" || selectedValue == "QRIS Bankaltimtara") {
                        await Tagihan.deleteTagihan(widget.nop);
                        var success = await RiwayatTagihan.createRiwayatTagihan(widget.nop, widget.pokok, widget.denda, widget.tahun, selectedValue!);
                        if (success) {
                          Get.defaultDialog(
                            backgroundColor: Colors.white,
                            middleText: "Tagihan berhasil dibayarkan",
                            middleTextStyle: TextStyle(
                              fontFamily: "'Poppins",
                            ),
                            onConfirm: () async {
                              var id = await Tagihan.getIDRiwayatTagihan(widget.nop, widget.tahun);
                              Get.back();
                              Get.to(PembayaranTagihanWidget(id: id));
                            },
                            radius: 16,
                          );
                        }
                      } else {
                        Get.defaultDialog(
                          backgroundColor: Colors.white,
                          middleText: "Harap pilih Jenis Pembayaran terlebih dahulu!",
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
                      primary: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Text(
                      'Konfirmasi dan Bayar',
                      style: TextStyle(
                        color: Color(0xFF65A25E),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
