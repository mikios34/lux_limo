import 'dart:io';

import 'package:beyride/model/reservation/reservation.dart';
import 'package:beyride/screens/address/address_adder.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:beyride/util/pdf_notification_helper.dart';
import 'package:beyride/widget/mail_address_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class AddAddressBottomSheet extends StatelessWidget {
  const AddAddressBottomSheet({
    super.key,
    required this.refetch,
  });
  final Future<QueryResult<Object?>?> Function()? refetch;

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
          _buildRecieptTypes(Icons.home, "Home", context, 0),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: const Divider(),
          ),
          _buildRecieptTypes(Icons.work, "Work", context, 1),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: const Divider(),
          ),
          _buildRecieptTypes(Icons.location_pin, "Place", context, 2),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _buildRecieptTypes(
      IconData icon, String title, BuildContext context, int index) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      onTap: () {
        Navigator.pop(context);
        Get.to(() => AddressAdderPage(
              type: title,
              refetch: refetch,
            ));
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
            letterSpacing: 1.2,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
