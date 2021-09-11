const GET_LOGGED_USER_QUERY_DATA_KEY = "getLoggedUser";
const GET_LOGGED_USER_QUERY = ''' 
query getLoggedUser {
  getLoggedUser {
    __typename
    ... on User {
      id
      userName
      profilePicture
      email
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
