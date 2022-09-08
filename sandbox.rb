require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'todos')

new_value = nil
client[:statistics].find(:key => 'visits').each { |doc| puts doc[:value] }
# client[:statistics].find(:key => 'visits').each { |doc| new_value = doc[:value] + 1 }
# client[:statistics].update_one({:key => 'visits'}, '$set' => {:value => new_value})
client[:statistics].update_one({:key => 'visits'}, '$set' => {:value => 0})
client[:statistics].find(:key => 'visits').each { |doc| puts doc[:value] }

client.close

