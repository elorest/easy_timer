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
        return total_time.verbose 
      else
        return total_time
      end
    end
	end

  def verbose
    time_hash = {}
    seconds = self.to_i
    milliseconds = (self.to_f - seconds)
    time_hash[:weeks], seconds = seconds.divmod(604800)
    time_hash[:days], seconds = seconds.divmod(86400)
    time_hash[:hours], seconds = seconds.divmod(3600)
    time_hash[:minutes], seconds = seconds.divmod(60)
    time_hash[:seconds] = seconds + milliseconds
    return time_hash.select{|k,v| v > 0}.inject([]){|verbose, array|
      k, v = array
      verbose << "#{v.is_a?(Float) ? sprintf("%.2f", v) : v} #{v > 1 ? k : k.to_s.chars.to_a[0..-2].join}"
    }.join(" ")
  end
end

class Time
  include EasyTimer
end
