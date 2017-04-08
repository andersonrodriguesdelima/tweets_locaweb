class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.obtain_json
	uri = URI('http://tweeps.locaweb.com.br/tweeps')

    req = Net::HTTP::Get.new(uri)
    req['Username'] = 'anderson.rodrigues.lima@hotmail.com'

    respost = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }
    json = JSON.parse respost.body

    json
  end
end
