const SEARCH_CRYPTO_CURRENCY_DATA_KEY = "searchCryptoCurrency";
const SEARCH_CRYPTO_CURRENCY_QUERY = ''' 
query searchCryptoCurrency(\$input: String!){
  searchCryptoCurrency(input:\$input){
    __typename
    ... on CryptoCurrency{
      id
      name
      symbol
      price
      icon
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
