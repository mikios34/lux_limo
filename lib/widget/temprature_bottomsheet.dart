import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehiclePrefernceBottomsheet extends StatelessWidget {
  const VehiclePrefernceBottomsheet({super.key, required this.prefernnces});
  final List<String> prefernnces;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Temprature',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Divider(),
                  ),
              itemBuilder: (context, index) => Row(
                    children: [
                      Container(
                        width: 54.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          shape: BoxShape.circle,
                        ),
                        child: Material(
                            color: Colors.transparent,
                            child: Icon(
                              index == 0
                                  ? Icons.water
                                  : index == 1
                                      ? Icons.music_note
                                      : index == 2
                                          ? Icons.shopping_bag_rounded
                                          : Icons.storefront_rounded,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        prefernnces[index],
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
              itemCount: 4),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
    
  }
}
