require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'todos')

client[:statistics].find(:key => 'visits').each { |doc| puts doc[:value] }

client[:statistics].update_one({:key => 'visits'}, '$set' => {})

client.close

