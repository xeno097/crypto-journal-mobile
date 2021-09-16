const CREATE_TRANSACTION_DATA_KEY = "createTransaction";
const CREATE_TRANSACTION_MUTATION = ''' 
mutation createTransactions(\$input: CreateTransactionInput!){
  createTransaction(input: \$input){
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
