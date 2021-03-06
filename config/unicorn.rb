worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
 timeout 15
 preload_app true

 before_fork do |server, worker|

   Signal.trap 'TERM' do
     puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
     Process.kill 'QUIT', Process.pid
   end

   defined?(ActiveRecord::Base) and
     ActiveRecord::Base.connection.disconnect!
 end 

 after_fork do |server, worker|

   Signal.trap 'TERM' do
     puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
   end

   defined?(ActiveRecord::Base) and
     ActiveRecord::Base.establish_connection
 end
 

#worker_processes 3
#timeout 30
#preload_app true
#
#before_fork do |server, worker|
#  # Replace with MongoDB or whatever
#  if defined?(ActiveRecord::Base)
#    ActiveRecord::Base.connection.disconnect!
#    Rails.logger.info('Disconnected from ActiveRecord')
#  end
#
#  # If you are using Redis but not Resque, change this
#  if defined?(Resque)
#    Resque.redis.quit
#    Rails.logger.info('Disconnected from Redis')
#  end
#
#  sleep 1
#end
#
#after_fork do |server, worker|
#  # Replace with MongoDB or whatever
#  if defined?(ActiveRecord::Base)
#    ActiveRecord::Base.establish_connection
#    Rails.logger.info('Connected to ActiveRecord')
#  end
#
#  # If you are using Redis but not Resque, change this
#  if defined?(Resque)
#    Resque.redis = ENV['REDIS_URI']
#    Rails.logger.info('Connected to Redis')
#  end
#end