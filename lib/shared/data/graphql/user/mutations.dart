const UPDATE_LOGGED_USER_MUTATION_DATA_KEY = "updateLoggedUser";
const UPDATE_LOGGED_USER_MUTATION = ''' 
mutation updateLoggedUser (\$input: UpdateLoggedUserInput!){
  updateLoggedUser(input: \$input) {
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
