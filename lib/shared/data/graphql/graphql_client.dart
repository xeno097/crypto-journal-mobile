abstract class IGraphqlClient {
  Future<Map<String, dynamic>> query({
    required String query,
    required String dataKey,
    Map<String, dynamic>? variables,
  });

  Future<Map<String, dynamic>> mutate({
    required String mutation,
    required String dataKey,
    Map<String, dynamic>? variables,
  });
}
