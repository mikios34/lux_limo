import 'package:beyride/util/util.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OneLineTextShimmer extends StatelessWidget {
  const OneLineTextShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: 15,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black),
                )),
          );
        },
      ),
    );
  }
}
