require 'rest_client'
require 'json'
aaa=File.read('database_json.json')
url = "http://or-ohev-zion.herokuapp.com//insert_site_db"

RestClient.post url, aaa, :content_type => :json, :accept => :json
#RestClient.post url, aaa
