const REFRESH_TOKEN_MUTATION = ''' 
mutation refreshToken (\$input: String!){
  refreshToken(
    input: \$input
  ) {
    __typename
    ... on AuthPayload {
      accessToken
      refreshToken
      user {
        id
        userName
        profilePicture
        email
      }
    }
    ... on ApiError {
      code
      message
    }
  }
}
''';
