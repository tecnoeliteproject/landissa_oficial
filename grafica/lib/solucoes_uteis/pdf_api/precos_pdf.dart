import 'dart:io';
import 'package:componentes_visuais/componentes/formatos/formatos.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:yetu_gestor/solucoes_uteis/formato_dado.dart';

import '../../dominio/entidades/customer.dart';
import '../../dominio/entidades/invoice.dart';
import '../../dominio/entidades/supplier.dart';
import 'pdf_api.dart';

class PrecosPdf {
  static Future<File> generate(Invoice invoice,
      {required List<String> cabecalho}) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 1 * PdfPageFormat.cm),
        buildTitle(invoice),
        buildInvoice(cabecalho, invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(
        name:
            '${invoice.titulo.toUpperCase()} ${formatarMesOuDia(invoice.info.date.day)}-${formatarMesOuDia(invoice.info.date.month)}-${invoice.info.date.year}.pdf',
        pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildSupplierAddress(invoice.supplier),
              Spacer(),
              Text("Data: ${formatarData(invoice.info.date)}"),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(Customer customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.address),
        ],
      );

  static Widget buildSupplierAddress(Supplier supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier.name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.address),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.nif),
        ],
      );

  static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tabela de Preços",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(List<String> cabecalho, Invoice invoice) {
    return Table.fromTextArray(
      headers: cabecalho,
      data: invoice.items.map((e) => e.itens).toList(),
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellStyle: TextStyle(fontSize: 8),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.centerLeft,
      },
    );
  }

  // static Widget buildTotal(Invoice invoice) {
  //   final netTotal = invoice.items
  //       .map((item) => item.unitPrice * item.quantity)
  //       .reduce((item1, item2) => item1 + item2);
  //   final vatPercent = invoice.items.first.vat;
  //   final vat = netTotal * vatPercent;
  //   final total = netTotal + vat;

  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: Row(
  //       children: [
  //         Spacer(flex: 6),
  //         Expanded(
  //           flex: 4,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               buildText(
  //                 title: 'Net total',
  //                 value: Utils.formatPrice(netTotal),
  //                 unite: true,
  //               ),
  //               buildText(
  //                 title: 'Vat ${vatPercent * 100} %',
  //                 value: Utils.formatPrice(vat),
  //                 unite: true,
  //               ),
  //               Divider(),
  //               buildText(
  //                 title: 'Total amount due',
  //                 titleStyle: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //                 value: Utils.formatPrice(total),
  //                 unite: true,
  //               ),
  //               SizedBox(height: 2 * PdfPageFormat.mm),
  //               Container(height: 1, color: PdfColors.grey400),
  //               SizedBox(height: 0.5 * PdfPageFormat.mm),
  //               Container(height: 1, color: PdfColors.grey400),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static Widget buildFooter(Invoice invoice) => buildFooterGeral(invoice);

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}

Widget buildFooterGeral([invoice]) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text(
            "Processado por: LANDISSA ERP, DA: OKU SANGA (SU) - SOLUÇÕES TECNOLÓGICAS",
            style: TextStyle(fontSize: 5)),
        Text("Desenvolvedor: VENCESLAU EVANDRO CASSINDA MOREIRA",
            style: TextStyle(fontSize: 5)),
        Divider(),
      ],
    );
