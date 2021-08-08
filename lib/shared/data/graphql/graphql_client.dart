abstract class IGraphqlClient {
  Future<dynamic> query({
    required String query,
    required String dataKey,
    Map<String, dynamic>? variables,
  });

  Future<dynamic> mutate({
    required String mutation,
    required String dataKey,
    Map<String, dynamic>? variables,
  });
}
