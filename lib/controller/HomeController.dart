import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:leisure_yatra/utils/LocationUtils.dart';

class HomeController extends GetxController {

  HomeController(this._locationUtils);
  final LocationUtils _locationUtils;
  RxString currentPosition = "".obs;

  void getCurrentLocation() async {
    String? position = await _locationUtils.reverseGeoCoding();
    if(position != null && position.isNotEmpty == true) {
      currentPosition.value = position;
    }
  }
}