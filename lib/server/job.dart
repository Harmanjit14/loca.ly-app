import 'package:graphql/client.dart';
import 'package:localy/server/auth.dart';

List<dynamic> alljobs = [];

Future getsearchJobs(String area) async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  const String readRepositories = """
   {
  searchpgs(search:"punjab"){
    rent
    location
    roomtype
    url
  }
}
""";
  final QueryOptions options = QueryOptions(
    document: gql(readRepositories),
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return 0;
  } else {
    alljobs = result.data["searchpgs"];
    print("done data");
    return 1;
  }
}

Future getExpandedJobs(String area) async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  const String readRepositories = """
   {
  searchpgs(search:"punjab"){
     id
    rent
    location
    roomtype
    kitchenAvailable
    url
    usertype
  	laundryIncluded
    washroomAttached
    url
    createdBy{
      profile{
        name
        mobile
      }
    }
  }
}
""";
  final QueryOptions options = QueryOptions(
    document: gql(readRepositories),
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return 0;
  } else {
    alljobs = result.data["searchpgs"];
    print("done data");
    return 1;
  }
}
