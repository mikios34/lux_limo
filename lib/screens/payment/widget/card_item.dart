import 'package:beyride/model/card/card_model.dart';
import 'package:beyride/widget/delete_card_bottomsheet.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.card, required this.refetch});
  final CardModel card;
  final Future<QueryResult<Object?>?> Function()? refetch;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: const Icon(
        Icons.payment,
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
              return DeleteCardBottomSheet(
                cardId: card.id,
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
        card.number,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.06,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        card.logo,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.06,
          color: Colors.black,
        ),
      ),
    );
  }
}
