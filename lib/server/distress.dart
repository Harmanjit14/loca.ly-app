import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graphql/client.dart';
import 'package:localy/server/auth.dart';
import 'package:localy/server/location.dart';

Future<void> sendDistress() async {
  await getAndsendLoc();
}

Future<int> getAndsendLoc() async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: GraphQLCache(),
    link: _link,
  );

  location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  placemarks =
      await placemarkFromCoordinates(location.latitude, location.longitude);
  print("GOT LOCATION");
  String getAuthToken = """
 mutation{
  addPolice(street: "${placemarks[0].street}" ,state: "${placemarks[0].locality}" ,city: "${placemarks[0].subLocality}" ){
   __typename
  }
}
""";
  MutationOptions tokenGet = MutationOptions(
    document: gql(getAuthToken),
  );
  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    print("done");
    return 1;
  }
}
