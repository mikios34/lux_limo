import 'package:flutter/material.dart';

class LoadinProgressIndicator extends StatelessWidget {
  const LoadinProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          child: Center(
              child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              color: Colors.white,
              backgroundColor: Colors.black,
            ),
          ))),
    );
  }
}

class LinearLoadingProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Dialog(
                elevation: 0,
                insetPadding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  height: 2,
                  child: LinearProgressIndicator(
                    // minHeight: 5,
                    color: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
