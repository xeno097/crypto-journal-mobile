const GET_SELF_BALANCE_DATA_KEY = "getSelfBalance";
const GET_SELF_BALANCE_QUERY = ''' 
query getSelfBalance{
  getSelfBalance{
    __typename
    ... on Balance{
      id
      balance
      cryptoCurrency
      cryptoValue
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
