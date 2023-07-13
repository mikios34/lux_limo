import 'dart:io';

import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/model/vehicle.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:beyride/util/pdf_notification_helper.dart';
import 'package:beyride/util/util.dart';
import 'package:beyride/widget/mail_address_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class RecieptBottomSheet extends StatelessWidget {
  const RecieptBottomSheet({super.key, required this.reservation});
  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 30.0,
              height: 30.0,
              margin: const EdgeInsets.only(right: 16, top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
                shape: BoxShape.circle,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 18,
                    )),
              ),
            ),
          ),
          _buildRecieptTypes(Icons.email, "Email Reciept", context, 0),
          const Divider(),
          _buildRecieptTypes(Icons.download, "Download Reciept", context, 1),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _buildRecieptTypes(
      IconData icon, String title, BuildContext context, int index) {
    return ListTile(
      onTap: () async {
        if (index == 0) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (BuildContext cont) => MailAddressDialog(),
          );
        }
        if (index == 1) {
          showDialog(
            context: context,
            builder: (context) => const LoadinProgressIndicator(),
          );
          savePdf(reservation);
          // final pdf = pw.Document();
          // pdf.addPage(
          //   pw.Page(
          //     build: (pw.Context context) {

          //       pw.Column(
          //         children: [pw.Text("FDF")],
          //       );

          //       pw.Center(
          //         child: pw.Text('Trip# ${reservation.receiptNumber}',
          //             style: const pw.TextStyle(fontSize: 20)),
          //       );
          //     },
          //   ),
          // );

          Navigator.pop(context);
          Navigator.pop(context);

          // FlutterT
        }
      },
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(title,
          style: GoogleFonts.inter(
            fontSize: 14,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w400,
          )),
    );
  }

  Widget _pdfFormat() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kToolbarHeight + 30,
          ),
          Container(
            width: 108,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.asset(
                "assets/images/lux.png",
                fit: BoxFit.fill,
                height: 90,
                // width: 120,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Lux Limo",
            style: GoogleFonts.inter(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.06,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: "Thank You, ",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "Lux Limo",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: "Reciept Number: ",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "1234",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Row(
            children: [
              Flexible(
                  flex: 2,
                  child: SizedBox(
                      width: double.infinity, child: Text("Place Holder"))
                  // Image.network(width: double.infinity, 'src')

                  ),
              SizedBox(
                width: 13,
              ),
              Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vehcile Name",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.06,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Vehicle Make",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: "From : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: "To : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: "Pickup Date : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: "Pickup Time : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: "Paid Date : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: "Paid Time : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: "Payment : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Subtotal : \$5345",
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.06,
                color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tax : \$53",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.06,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: "Total : ",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.06,
              ),
              children: [
                TextSpan(
                  text: "placeeeeeee name ",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.06,
                  ),
                )
              ])),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

// Function to generate the PDF
  Future<pw.Document> generatePdf(Reservation reservation) async {
    final pdf = pw.Document();
    final netImage = await networkImage(reservation.vehicleMake!.vehicleLogo!);
    final im = pw.MemoryImage(
      (await rootBundle.load('assets/images/lux.png')).buffer.asUint8List(),
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            padding: pw.EdgeInsets.symmetric(horizontal: 16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  width: 108,
                  child: pw.ClipRRect(
                    horizontalRadius: 3,
                    verticalRadius: 3,
                    //borderRadius: pw.BorderRadius.circular(3),
                    child: pw.Image(
                      im,
                      fit: pw.BoxFit.fill,
                      height: 90,
                    ),
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                  "Lux Limo",
                  style: pw.TextStyle(
                    fontSize: 25,
                    fontWeight: pw.FontWeight.normal,
                    letterSpacing: 0.06,
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Thank You, ",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.normal,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: "Lux Limo",
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 0.06,
                        ),
                      )
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 7,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Receipt Number: ",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.normal,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: reservation.receiptNumber,
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Divider(
                  color: PdfColors.grey300,
                ),
                pw.Row(
                  children: [
                    pw.Flexible(
                      flex: 2,
                      child: pw.SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: pw.Image(netImage),
                      ),
                    ),
                    pw.SizedBox(
                      width: 13,
                    ),
                    pw.Flexible(
                      flex: 3,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            reservation.vehicleMake!.vehicleModel!,
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.normal,
                              letterSpacing: 0.06,
                            ),
                          ),
                          pw.SizedBox(
                            height: 7,
                          ),
                          pw.Text(
                            reservation.vehicleMake!.vehicleMake!,
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.normal,
                              letterSpacing: 0.06,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.Divider(
                  color: PdfColors.grey300,
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "From: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: reservation.pickup,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 7,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "To: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: reservation.dropoff,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Divider(
                  color: PdfColors.grey300,
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Pickup Date: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: getDatefromDateTime(
                            DateTime.now().millisecondsSinceEpoch.toString()),
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 7,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Pickup Time: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: getTimefromDateTime(
                            DateTime.now().millisecondsSinceEpoch.toString()),
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Divider(
                  color: PdfColors.grey300,
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Paid Date: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: getDatefromDateTime(
                            DateTime.now().millisecondsSinceEpoch.toString()),
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 7,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Paid Time: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: getDatefromDateTime(
                            DateTime.now().millisecondsSinceEpoch.toString()),
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 7,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Payment: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: "*** **** 3453",
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Divider(
                  color: PdfColors.grey300,
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                  "Subtotal: \$5345",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.normal,
                    letterSpacing: 0.06,
                    color: PdfColors.grey600,
                  ),
                ),
                pw.SizedBox(
                  height: 7,
                ),
                pw.Text(
                  "Tax: \$53",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.normal,
                    letterSpacing: 0.06,
                    color: PdfColors.grey600,
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Divider(
                  color: PdfColors.grey300,
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.RichText(
                  text: pw.TextSpan(
                    text: "Total: ",
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.06,
                    ),
                    children: [
                      pw.TextSpan(
                        text: "\$567",
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf;
  }

// Generate PDF and save it to a file
  void savePdf(Reservation reservation) async {
    final output = await getTemporaryDirectory();

    final pdf = generatePdf(reservation);
    final file = File('${output.path}/receipt.pdf');

    await file.writeAsBytes(await pdf.then((value) => value.save()));

    showNotification(file.path);
  }
}
