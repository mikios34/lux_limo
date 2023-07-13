import 'package:beyride/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MailAddressDialog extends StatelessWidget {
  const MailAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Send Reciept to:",
                  style: GoogleFonts.inter(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.6),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        style: inputTextStyle,
                        autofocus: true,
                        decoration: const InputDecoration(
                            hintText: "Your Email address.",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.2))),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 44.0,
                      height: 44.0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        // border:
                        //     Border.all(color: Theme.of(context).primaryColor, width: 1),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              width: 28.0,
              height: 28.0,
              // margin: const EdgeInsets.only(right: 16, top: 10),
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
                      size: 15,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
