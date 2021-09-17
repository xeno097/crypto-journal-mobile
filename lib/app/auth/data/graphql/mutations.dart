const SIGN_IN_MUTATION_DATA_KEY = "signIn";
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

const REFRESH_TOKEN_MUTATION_DATA_KEY = "refreshToken";
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
