import 'package:graphql/client.dart';
import 'package:localy/server/auth.dart';

List<dynamic> allLocs = [];

Future getallLocs(String area) async {
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
  alllocations{
    rating
    city
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
    allLocs = result.data["alllocations"];
    print("done data");
    return 1;
  }
}

Future getmyLocs(String area) async {
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
  alllocations{
    rating
    city
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
    allLocs = result.data["alllocations"];
    print("done data");
    return 1;
  }
}
