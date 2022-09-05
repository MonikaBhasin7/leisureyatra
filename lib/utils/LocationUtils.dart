import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationUtils {
  Future<Position> getCurrentLocation() async {
    await getLocationPermission();
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      switch(permission) {
        case LocationPermission.always:
        case LocationPermission.whileInUse:{
          break;
        }
        case LocationPermission.denied:{
          return Future.error('Location permissions are denied');
        }
        case LocationPermission.deniedForever: {
          return Future.error('Location permissions are permanently denied, we cannot request permissions.');
        }
        default: { print("Invalid choice"); }
        break;
      }
    }
  }

  Future<String?> reverseGeoCoding() async {
    Position position = await getCurrentLocation();
    List<Placemark> placeMark =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    return placeMark[0].locality;
  }
}

