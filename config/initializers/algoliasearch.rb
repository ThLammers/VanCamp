AlgoliaSearch.configuration = {
  application_id: ENV['ALGOLIA_APP_ID'],
  api_key: ENV['ALGOLIA_API_KEY'],
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5
}
