import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static centerCircularProgressIndicator(){
    return const Center(child: CircularProgressIndicator(),);
  }

  static alertDialogCloseMessageBox(BuildContext context,String head,String message){
   return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(head),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Kapat"))
        ],
      ),
    );
  }

  static progressIndicaterMessage(BuildContext context,String toastMessage) async{
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds:1), () async {
            Navigator.of(context).pop(true);
            Utils.toastMessage(toastMessage);
            Future.delayed(Duration(seconds: 1));
            Navigator.of(context).pushNamed("/test");
          });
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
    );
  }
  
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          borderRadius: BorderRadius.circular(8),
          icon: const Icon(Icons.error),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(10),
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
