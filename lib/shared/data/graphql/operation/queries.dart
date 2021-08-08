const GET_OPERATIONS_DATA_KEY = "getOperations";
const GET_OPERATIONS_QUERY = ''' 
query {
  getOperations{
    __typename
    ... on Operation{
      id
      name
      slug
      type
    }
    ... on ApiError{
      code
      message
      errors{
        field
        message
      }
    }
  }
}
''';
