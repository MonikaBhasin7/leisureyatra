import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {


  void initializeControllers() {


  }

  void submitForm(String? name, String? email, String? phone, String? passenger, DateTime? pickedDate,
      Function(String) errorCallback, Function(String) successCallback) async {
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
      return;
    }
    try {
      await FirebaseFirestore.instance.collection('User').add({
        "name": name,
        "email": email,
        "phone": phone,
        "passenger": passenger,
        "pickedDate": pickedDate.toString()
      });
      successCallback("Your query/information has been submitted");
      return;
    } catch (e) {
      errorCallback("Error in submitting. Please try again");
      return;
    }
  }
}