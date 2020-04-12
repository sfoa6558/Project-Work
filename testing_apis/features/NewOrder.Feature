Feature: Create New Order
  As a Trader, I want to be able to create an order so I can trade Cryptocurrency
  at Gemini

  Scenario: Post request to  /v1/order/new will respond with a 200
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with 'exchange limit'
    Then the response code will be 200

  Scenario: Post request to  /v1/order/new will respond with a 200
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with 'exchange stop limit'
    Then the response code will be 200

  Scenario: Post request to  /v1/order/new with side:sell will respond with a 200
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with side sell
    Then the response code will be 200

  Scenario: Post request to  /v1/order/new with invalid API Key will respond with a 400
    When I perform a POST request 'https://api.sandbox.gemini.com/v1/order/new' with invalid api key
    Then the response code will be 400

  Scenario: Post request to  /v1/order/new with no payload will respond with a 400
    When I perform a POST request 'https://api.sandbox.gemini.com/v1/order/new' with no payload
    Then the response code will be 400

  Scenario: Post request to  /v1/order/new will return expected values in a response
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with 'exchange stop limit'
    Then I see all the keys in the response with 'exchange stop limit'

  Scenario: Post request to  /v1/order/new will with stop price greater than buy price respond with a 400
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with stop price greater than buy price
    Then the response code will be 400

  Scenario: Post request to  /v1/order/new will with stop price greater than buy price respond with a 400
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with stop price less than sell price
    Then the response code will be 400

  Scenario: Post request to  /v1/order/new will return expected values in a response
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with 'exchange stop limit'
    Then all the values are of the correct type in the response with 'exchange stop limit'

  Scenario: Post request to  /v1/order/new will return expected values in a response
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with 'exchange limit'
    Then I see all the keys in the response with 'exchange limit'

  Scenario: Post request to  /v1/order/new will return expected values in a response
    When I perform a POST request to 'https://api.sandbox.gemini.com/v1/order/new' with 'exchange limit'
    Then all the values are of the correct type in the response with 'exchange limit'