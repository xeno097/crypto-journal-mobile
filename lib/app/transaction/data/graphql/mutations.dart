const CREATE_TRANSACTION_DATA_KEY = "createTransaction";
const CREATE_TRANSACTION_MUTATION = ''' 
mutation createTransactions(\$input: CreateTransactionInput!){
  createTransaction(input: \$input){
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

const DELETE_TRANSACTION_DATA_KEY = "deleteSelfTransaction";
const DELETE_TRANSACTION_MUTATION = """ 
mutation deleteTransaction(\$input: ID!) {
  deleteSelfTransaction(id: \$input) {
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
""";
