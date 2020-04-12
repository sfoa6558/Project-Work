When("I perform a POST request to {string} with {string}") do |string, string1|
  post(string,exchange_limit_payload,exchange_headers(exchange_limit_payload())) if string1 == "exchange limit"
  post(string,exchange_stop_payload,exchange_headers(exchange_stop_payload())) if string1 == "exchange stop limit"
end
Then("the response code will be {int}") do |int|
  expect_status(int)
end

When("the type is exchange|exchange stop limit") do

end


Then("I see all the keys in the response with {string}") do |string|
  expect_json_keys([:order_id, :id, :symbol, :exchange, :avg_execution_price, :side, :type, :timestamp, :timestampms, :is_live,
  :is_cancelled, :is_hidden, :was_forced, :executed_amount,  :options, :price, :original_amount, :remaining_amount]) if string == "exchange limit"

  expect_json_keys([:order_id, :id, :symbol, :exchange, :avg_execution_price, :side, :type, :timestamp, :timestampms, :is_live,
                    :is_cancelled, :is_hidden, :was_forced, :executed_amount, :client_order_id, :options, :stop_price, :price, :original_amount]) if string == "exchange stop limit"
end

Then("all the values are of the correct type in the response with {string}") do |string|

  expect_json_types(order_id: :string, id: :string, symbol: :string, exchange: :string, avg_execution_price: :string, side: :string, type: :string,
                    timestamp: :string, timestampms: :int, is_live: :bool, is_cancelled: :bool, is_hidden: :bool, was_forced: :bool, executed_amount: :string,
                    options: :array, price: :string, original_amount: :string, remaining_amount: :string) if string == "exchange limit"

  expect_json_types([order_id: :string, id: :string, symbol: :string, exchange: :string, avg_execution_price: :string, side: :string, type: :string, timestamp: :string,
                     timestampms: :int, is_live: :boolean, is_cancelled: :boolean,
                     is_hidden: :false, was_forced: :false, executed_amount: :string, client_order_id: :string, options: :array,
                     stop_price: :string, price: :string, original_amount: :string]) if string == "exchange stop limit"
end

When("I perform a POST request {string} with invalid api key") do |string|
  post(string,exchange_limit_payload,exchange_headers(exchange_limit_payload, 'test'))
end

When("I perform a POST request {string} with no payload") do |string|
  post(string,{},exchange_headers({}))
end

When("I perform a POST request to {string} with side sell") do |string|
  post(string,exchange_limit_payload('sell'),exchange_headers(exchange_limit_payload('sell')))
end

When("I perform a POST request to {string} with stop price greater than buy price") do |string|
  post(string,exchange_stop_payload('15000'),exchange_headers(exchange_stop_payload('15000')))
end

When("I perform a POST request to {string} with stop price less than sell price") do |string|
  post(string,exchange_stop_payload('9000', 'sell'),exchange_headers(exchange_stop_payload('9000', 'sell')))
end

########## Helper methods
def api_secret
  "4KXcBdatdrE7MQPBCuG2pQSLDTdw"
end
def api_key
  "account-eZrrd7LgyslE6ypyOci9"
end


def exchange_data(payload)
  Base64.encode64(JSON.dump(payload)).split.join('')
end

def payload_nonce
   (Time.now.to_f * 1000).to_i

end

def exchange_limit_payload(side = 'buy')
  {"request": "/v1/order/new", "nonce": payload_nonce, "client_order_id": "470135", "symbol": "btcusd", "amount": "5", "price": "3633.00", "side": side, "type": "exchange limit", "options": ["maker-or-cancel"]}
end

def exchange_stop_payload(stop_price = '10000', side = 'buy')
  {"amount": ".1", "client_order_id": "470135", "price": "10500", "nonce": payload_nonce, "side": side, "request": "/v1/order/new", "stop_price": stop_price, "symbol": "btcusd", "type": "exchange stop limit"}
end




def exchange_headers(payload, api_key = 'account-eZrrd7LgyslE6ypyOci9')
  {"Content-Type": "text/plain",
   "Content-Length": "0",
   "X-GEMINI-APIKEY": api_key,
   "X-GEMINI-PAYLOAD": exchange_data(payload),
   "X-GEMINI-SIGNATURE": OpenSSL::HMAC.hexdigest("SHA384", api_secret, exchange_data(payload)),
   "Cache-Control": "no-cache"}
end