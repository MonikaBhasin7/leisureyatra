import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {


  void initializeControllers() {


  }

  void submitForm(String? name, String? email, String? phone, String? passenger, DateTime? pickedDate,
      Function(String) errorCallback, Function(String) successCallback) {
    if(name == null || name.isEmpty) {
      errorCallback("Please mention full name.");
      return;
    }
    if(phone == null || phone.isEmpty || phone.length < 10) {
      errorCallback("Please mention full phone number.");
      return;
    }
    if(passenger == null || passenger.isEmpty) {
      errorCallback("Please mention number of passengers.");
    }
    errorCallback(pickedDate.toString());
  }
}