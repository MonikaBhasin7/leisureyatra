import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_yatra/screens/form/FormController.dart';
import 'package:leisure_yatra/utils/ColorConstants.dart';
import 'package:leisure_yatra/utils/DateTimeUtil.dart';
import 'package:leisure_yatra/utils/SnackBarUtils.dart';

import '../../utils/GlobalWidgets.dart';
import '../../utils/TextStyles.dart';

class FormScreen extends StatefulWidget {
  String? placeName;

  FormScreen(this.placeName);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  FormController _formController = Get.put(FormController());
  TextEditingController? fullNameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passengersController;
  TextEditingController? bookingDateController;
  TextEditingController? messageController;
  DateTime? pickedDate;

  @override
  void initState() {
    super.initState();
    _formController.initializeControllers();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passengersController = TextEditingController();
    bookingDateController = TextEditingController();
    messageController = TextEditingController();
    if(widget.placeName != null) {
      messageController?.text = "${widget.placeName} / ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primary_color,
          title: Text("Make memories that last a lifetime..."),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                outlinedTextField(
                    labelText: 'Full Name',
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(
                      Icons.person,
                      color: primary_color,
                    ),
                    controller: fullNameController),
                SizedBox(
                  height: 16,
                ),
                outlinedTextField(
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email,
                      color: primary_color,
                    ),
                    controller: emailController),
                SizedBox(
                  height: 16,
                ),
                outlinedTextField(
                    labelText: 'Phone number',
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: primary_color,
                    ),
                    controller: phoneController),
                SizedBox(
                  height: 16,
                ),
                outlinedTextField(
                    labelText: 'Number of Passengers',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(
                      Icons.man,
                      color: primary_color,
                    ),
                    controller: passengersController),
                const SizedBox(
                  height: 16,
                ),
                outlinedTextField(
                    labelText: 'Booking Date',
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(
                      Icons.calendar_today,
                      color: primary_color,
                    ),
                    controller: bookingDateController,
                    onTapCallback: () {
                      _selectDate();
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }),
                const SizedBox(
                  height: 16,
                ),
                outlinedTextField(
                    labelText: 'Message',
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.message,
                      color: primary_color,
                    ),
                    controller: messageController,
                    maxLength: 200,
                    height: 30),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primary_color,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
                    onPressed: () {
                      _formController.submitForm(
                          fullNameController?.text,
                          emailController?.text,
                          phoneController?.text,
                          passengersController?.text,
                          pickedDate, (message) {
                        context.showToastOnError(message: message);
                      }, (message) {
                        context.showToastOnSuccess(message: message);
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      'Enquiry Now',
                      style: textStyleWithSizeColorWeight(
                          18.0, Colors.white, FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }

  Future _selectDate() async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    bookingDateController?.text = DateTimeUtils.instance
        .convertDateFromOneFormatToAnother(
            date: pickedDate.toString(),
            inputFormat: DateTimeUtils.YYYYMMDDHHMMSS,
            outputFormat: DateTimeUtils.ddMMyyyy);
    setState(() {});
  }
}
