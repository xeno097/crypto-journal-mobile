const SIGN_IN_MUTATION = ''' 
mutation signIn(\$input: String!) {
  signIn(
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
      errors {
        field
        message
      }
    }
  }
}
''';
