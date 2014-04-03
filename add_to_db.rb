require 'rest_client'
def main

RestClient.post "http://0.0.0.0:3000/add_db", { desc: 'QA assistant', salary: 6 }.to_json
end 
