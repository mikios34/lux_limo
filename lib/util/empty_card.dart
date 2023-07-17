import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          SizedBox(
              height: 250,
              child: LottieBuilder.asset("assets/lottie/empty.json")),
          // Image(
          //     height: MediaQuery.of(context).size.height * 0.15,
          //     image: AssetImage(imageUrl)),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}