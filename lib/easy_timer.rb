require "easy_timer/version"

module EasyTimer
  def timer(options = {}, &block)
  	start_time = Time.now
  	yield
  	total_time = Time.now - start_time
  	puts total_time.to_i
  end
end
