import 'package:beyride/model/address/address_model.dart';
import 'package:beyride/widget/delete_address_bottomsheet.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.address, required this.refetch});
  final Address address;
  final Future<QueryResult<Object?>?> Function()? refetch;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: Icon(
        address.type == "Home"
            ? Icons.home
            : address.type == "Work"
                ? Icons.work
                : Icons.location_pin,
        color: Colors.black,
        size: 30,
      ),
      trailing: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            builder: (context) {
              return DeleteAddressBottomSheet(
                addressId: address.id!,
                refetch: refetch,
              );
            },
          );
        },
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ),
      title: Text(
        address.address!,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.4,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        address.address!.split(',').last,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.4,
          color: Colors.black,
        ),
      ),
    );
  }
}
