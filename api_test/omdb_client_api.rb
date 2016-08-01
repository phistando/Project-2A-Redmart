require "httparty"

URL = "http://www.omdbAPI.com/"
query = "?s=Die Hard&r=json"

result = HTTParty.get URL + URI.encode( query )
puts result


URL + URI.encode("?s=Die")
