import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';

class Print extends StatefulWidget {
  final String nominal;
  final String name;
  final String status;
  final String id;
  const Print(
      {Key? key,
      required this.nominal,
      required this.name,
      required this.id,
      required this.status})
      : super(key: key);

  @override
  State<Print> createState() => _PrintState();
}

class _PrintState extends State<Print> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPrintableData(
          {'Nama Pengguna': widget.name, 'Nominal Penarikan': widget.nominal}),
    );
  }
}

buildPrintableData(doc, {String}) => pw.Padding(
      padding: const pw.EdgeInsets.all(25.00),
      child: pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Nama Pengguna",
                style: pw.TextStyle(
                  fontSize: 16,
                ),
              ),
              pw.Text(
                'data',
                style: pw.TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 15.00),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Nominal Penarikan",
                style: pw.TextStyle(
                  fontSize: 16,
                ),
              ),
              pw.Text(
                'data',
                style: pw.TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 15.00),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "Status Penarikan",
                style: pw.TextStyle(
                  fontSize: 16,
                ),
              ),
              pw.Text(
                "Selesai melakukan penarikan",
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
