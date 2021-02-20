import 'package:graphql/client.dart';

String token = "";
String finName = "";

Future<int> getToken(String email, String password) async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'JWT $token',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  final Link link = authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

  String getAuthToken = """
  mutation{
  tokenAuth(email: "$email" ,password: "$password" ){
    token
    refreshExpiresIn
  }
}
""";
  MutationOptions tokenGet = MutationOptions(
    // ignore: deprecated_member_use
    document: gql(getAuthToken),
  );
  print("\n\nstarted\n\n");

  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    print("done");
    token = result.data["tokenAuth"]["token"];
    print("Done!");

    return 1;
  }
}

Future<int> createUser(String email, String password, String name) async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'JWT $token',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  final Link link = authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

  String getAuthToken = """
 mutation{
  createUser(email: "$email" ,password: "$password" ,name: "$name" ){
    __typename
  }
}
""";
  MutationOptions tokenGet = MutationOptions(
    document: gql(getAuthToken),
  );
  print("\n\nstarted\n\n");

  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    print("done");
    return 1;
  }
}

Future<int> me() async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'JWT $token',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  final Link link = authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

  String getAuthToken = """
{
  me{
    name
  }
}
""";
  QueryOptions tokenGet = QueryOptions(
    document: gql(getAuthToken),
  );
  print("\n\nstarted\n\n");

  QueryResult result = await _client.query(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    finName = result.data["me"]["name"];
    print("done");
    return 1;
  }
}
