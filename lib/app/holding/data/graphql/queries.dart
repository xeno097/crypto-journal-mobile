const GET_SELF_HOLDINGS_DATA_KEY = "getSelfHoldings";
const GET_SELF_HOLDINGS_QUERY = ''' 
query getSelfHoldings{
  getSelfHoldings{
    __typename
    ... on Holding{
      id
      holding
      symbol
      name
      icon
      value
      price
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
