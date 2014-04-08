require 'rest_client'
require 'json'
aaa=File.read('database_json.json')
url = "http://0.0.0.0:3000/insert_site_db"

RestClient.post url, aaa, :content_type => :json, :accept => :json
#RestClient.post url, aaa
