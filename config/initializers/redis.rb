$redis = Redis::Namespace.new("iot_thermostats", :redis => Redis.new)
