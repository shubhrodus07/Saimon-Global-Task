import 'package:graphql/client.dart';
import 'package:shubhro_project/model/datamodel.dart';

GraphQLClient getGithubGraphQLClient() {
  final Link _link = HttpLink(
    'https://b2c-api.flightlocal.com/graphql',
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}

Future<Datamodel> readRepositories(int nSkip, int nLimit) async {
  final GraphQLClient _client = getGithubGraphQLClient();

  final QueryOptions options = QueryOptions(
    document: gql(
      r'''
        query Gps($nSkip: Int!,$nLimit: Int!){
  getPackages(
    pagination: {
      skip: $nSkip
      limit: $nLimit
    }
  )
  {
    statusCode
    message
    result {
      count
      packages {
        uid
        title
        startingPrice
        thumbnail
        amenities {
          title
          icon
        }
        discount {
          title
          amount
        }
        durationText
        loyaltyPointText
        description
      }
    }
  }
}
      ''',
    ),
    variables: {
      'nSkip': nSkip,
      'nLimit': nLimit,
    },
  );

  final QueryResult result = await _client.query(options);

  if (result.hasException) {
    print(result.exception.toString());
  }

  final Datamodel datamodel = Datamodel.fromJson(result.data!['getPackages']);

  // datamodel.result.packages.forEach(
  //   (Package f) =>
  //       {print('Id: ${f.uid} Name: ${f.title}, Desc: ${f.description}')},
  // );
  return datamodel;
}
