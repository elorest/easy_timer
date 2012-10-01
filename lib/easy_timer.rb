require "easy_timer/version"

module EasyTimer
	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
	  def timer(options = {}, &block)
	  	start_time = Time.now
	  	yield
	  	total_time = Time.at(Time.now - start_time)
	  	if options[:verbose] || options[:v]

	    end
	  	return total_time
	  end
	end

  def to_verbose
  	time_hash = {}
  	seconds = self.to_i
  	milliseconds = (self.to_f - seconds)
  	time_hash[:weeks], seconds = seconds.divmod(604800)
  	time_hash[:days], seconds = seconds.divmod(86400)
  	time_hash[:hours], seconds = seconds.divmod(3600)
  	time_hash[:minutes], seconds = seconds.divmod(60)
  	time_hash[:seconds] = seconds + milliseconds
  	return time_hash.select{|k,v| v > 0}.inject(""){|vs, array|
  		k, v = array
  		vs << "#{v.is_a?(Float) ? sprintf("%.2f", v) : v} #{k} "
  	}.strip
  end
end

class Time
	include EasyTimer
end
