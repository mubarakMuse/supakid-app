
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../utils/app_colors.dart';

FToast fToast = FToast();

showToast(BuildContext context, {int duration = 3, String msg = ''}) {

  fToast.init(context);
  fToast.showToast(
    toastDuration: Duration(seconds: duration),
    gravity: ToastGravity.BOTTOM,
    child: Container(
      padding: const EdgeInsets.only(left: 13, top: 20, right: 5, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
        kWhiteColor, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(2, 3),
        ),
      ],
      ),
      child: Row(
        children: [
          // Image.asset('assets/images/t_logo.png', height: 15),
          // const SizedBox(width: 13),
          Expanded(
            child: Text(
              msg,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

showLoader(BuildContext dialogContext, message) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const Padding(
          padding:  EdgeInsets.all(1),
          child: CircularProgressIndicator(
            backgroundColor: kWhiteColor,
            color: kPrimaryColor,
          ),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                message,
                maxLines: 5,
                style: const TextStyle(fontSize: 16, ),
              ),
            )),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: dialogContext,
    builder: (BuildContext dialogContext) {
      return alert;
    },
  );
}

