import 'package:graphql/client.dart';

List<dynamic> alljobs = [];

Future getAllJobs() async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final _authLink = AuthLink(
    getToken: () async =>
        'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6Imd1cmxlZW5Abm90Tm9vYi5jb20iLCJleHAiOjE2MTM3OTc4NTUsIm9yaWdJYXQiOjE2MTM3OTc1NTV9.wnHIalgMxH9xda2Sl4eAcBDN8GCHBWMvd0nGdG-Zb24',
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
    alljobs = result.data as List;
    return 1;
  }
}
