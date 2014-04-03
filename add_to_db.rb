require 'rest_client'
require 'json'

aaa = {desc: "Photographer", salary: 13}
url = "http://0.0.0.0:3000/add_db"

# RestClient.post url, aaa.to_json, :content_type => :json, :accept => :json
RestClient.post url, aaa
