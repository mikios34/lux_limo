import 'package:beyride/api/address/mutation.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DeleteAddressBottomSheet extends StatelessWidget {
  const DeleteAddressBottomSheet({
    super.key,
    required this.addressId,
    required this.refetch,
  });
  final int addressId;
  final Future<QueryResult<Object?>?> Function()? refetch;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                child: Mutation(
                  options: MutationOptions(
                    onCompleted: (dynamic data) {
                      Navigator.pop(context);
                      refetch!();
                      Navigator.pop(context);

                      // Handle completion if needed
                    },
                    onError: (error) {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                        msg: 'Please try again',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      );
                    },
                    document: gql(deleteReservationUserAddressMutation),
                  ),
                  builder: (RunMutation runMutation, QueryResult? result) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor: Colors.red,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => LinearLoadingProgressIndicator(),
                        );
                        runMutation({
                          'id': addressId, // Replace with the actual address ID
                          'userId': GetStorage()
                              .read('uid'), // Replace with the actual user ID
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Delete Address"),
                        ],
                      ),
                    );
                  },
                )

                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         elevation: 0,
                //         backgroundColor: Theme.of(context).primaryColorDark,
                //         foregroundColor: Colors.red),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: const [
                //         Icon(
                //           Icons.delete_forever,
                //           color: Colors.red,
                //         ),
                //         SizedBox(
                //           width: 15,
                //         ),
                //         Text("Delete Address")
                //       ],
                //     )),
                ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                  // style: ElevatedButton.styleFrom(
                  //     minimumSize: Size.fromWidth(double.infinity)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
            ),
          ],
        ),
      ),
    );
  }
}
