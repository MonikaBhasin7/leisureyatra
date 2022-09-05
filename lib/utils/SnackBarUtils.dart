import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:travel_yatra/utils/ColorConstants.dart';

extension ToastExtensions on BuildContext {

  void showToastOnError({required String message, String? apiPath, String? statusCode, String? date}) {
      _showToast(message, apiPath, statusCode, date, true, this);
  }

  void showToastOnSuccess({required String message, String? apiPath, String? statusCode, String? date}) {
    _showToast(message, apiPath, statusCode, date, false, this);
  }


  void _showToast(String message, String? apiPath, String? statusCode,
      String? date, bool isError, BuildContext context) {
    var text = "";
    text = "$text$message";
    if (apiPath != null) {
      text = "$text\n$apiPath//";
    }
    if (statusCode!= null) {
      text = "$text$statusCode/";
    }
    if (date!= null) {
      text = "$text$date/";
    }
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: CustomErrorToast(text, isError),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
    });
  }
}

class CustomErrorToast extends StatelessWidget {
  String errorText;
  bool isError;

  CustomErrorToast(this.errorText, this.isError);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      decoration: BoxDecoration(
        color: isError ? pink : green_5,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Visibility(
            child: const Icon(
              Icons.error,
              color: red_4,
            ),
            visible: isError,
          ),
          Visibility(
            child: const Icon(
              Icons.check_circle,
              color: green_6,
            ),
            visible: !isError,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              errorText,
              style: TextStyle(color: tvHeadingColor),
            ),
          ),
          Expanded(
            child: Text(""),
          ),
        ],
      ),
    );
  }
}


