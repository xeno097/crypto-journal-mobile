const GET_TRANSACTIONS_DATA_KEY = "getSelfTransactions";
const GET_TRANSACTIONS_QUERY = ''' 
query getSelfTransactions(\$input: FilterInput) {
  getSelfTransactions(input: \$input) {
    __typename
    ... on Transaction {
      id
      coinSymbol
      coins
      cost
      fee
      coinPrice
      date
      operation {
        ... on Operation {
          id
          name
          slug
          type
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
      cryptoCurrency {
        __typename
        ... on CryptoCurrency {
          id
          name
          symbol
          price
          icon
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
