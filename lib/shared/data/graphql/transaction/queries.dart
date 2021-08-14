const GET_TRANSACTIONS_DATA_KEY = "getTransactions";
const GET_TRANSACTIONS_QUERY = ''' 
query getTransactions {
  getTransactions{
    __typename
    ... on Transaction{
      id
      coinSymbol
      coins
      cost
      fee
      coinPrice
      date
      operation{
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
          errors {
            field
            message
          }
        }
      }
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
