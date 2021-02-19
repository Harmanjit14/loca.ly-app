import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Position location = new Position();
List<Placemark> placemarks;

Future<int> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return 0;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return 0;
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return 0;
    }
  }

  location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  placemarks =
      await placemarkFromCoordinates(location.latitude, location.longitude);

  return 1;
}
