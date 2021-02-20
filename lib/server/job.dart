import 'package:graphql/client.dart';
import 'package:localy/server/auth.dart';

List<dynamic> alljobs = [];
List<dynamic> myjobs = [];

Future getJobs(String area) async {
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

  String readRepositories = """
   {
  searchpgs(search: "$area" ){
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
    myjobs = result.data["searchjobs"];
    print("done data");
    return 1;
  }
}

Future getAll(String area) async {
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
  alljobs{
    title
    rating{
      rating
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
    alljobs = result.data["alljobs"];
    print("done data");
    return 1;
  }
}
