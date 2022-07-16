import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfApi {
  static Future<File> generatePDF({
    required String fullName,
    required String nominal,
    required ByteData imageSignature,
  }) async {
    final document = PdfDocument();
    final page = document.pages.add();

    drawSignature(fullName, nominal, imageSignature, page);

    return saveFile(document);
  }

  static void drawSignature(
      String fullName, String nominal, ByteData imageSignature, PdfPage page) {
    final pageSize = page.getClientSize();
    final PdfBitmap image = PdfBitmap(imageSignature.buffer.asUint8List());

    page.graphics.drawImage(image,
        Rect.fromLTWH(pageSize.width - 120, pageSize.height - 200, 100, 40));
  }

  static Future<File> saveFile(PdfDocument document) async {
    final path = await getApplicationDocumentsDirectory();
    final fileName =
        path.path + '/Invoices${DateTime.now().toIso8601String()}.pdf';

    final file = File(fileName);
    file.writeAsBytes(document.save());
    document.dispose();

    return file;
  }
}
