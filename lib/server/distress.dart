import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:graphql/client.dart';
import 'package:localy/server/auth.dart';

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
  Position position = await Geolocator.getCurrentPosition(
      timeLimit: Duration(seconds: 10), desiredAccuracy: LocationAccuracy.best);
  double lat = position.latitude;
  double long = position.longitude;
  print(lat);
  print(long);
  var date = DateTime.now();
  String getAuthToken = """
  mutation{
    addEmergency(date : "${date.toString()}" ,latitude: "$lat" , longitude: "$long" ){
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
