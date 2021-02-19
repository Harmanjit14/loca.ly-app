import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Position location = new Position();
var response;

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

  response = await http.get(
      'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude={$location.latitude}&longitude=$location.longitude}&localityLanguage=en');

  if (response.statusCode == 200) {
    return 2;
  }
  return 1;
}
