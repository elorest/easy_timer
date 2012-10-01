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

  def verbose(options = {:msec => true})
    time_hash = {}
    seconds = self.to_i
    time_hash[:week], seconds = seconds.divmod(604800)
    time_hash[:day], seconds = seconds.divmod(86400)
    time_hash[:hour], seconds = seconds.divmod(3600)
    time_hash[:minute], seconds = seconds.divmod(60)
    time_hash[:second] = seconds
    time_hash[:second] += (self.to_f - self.to_i) if options[:msec]
    return time_hash.select{|k,v| v > 0}.inject([]) do |verbose, array|
      k, v = array
      verbose << "#{v.is_a?(Float) ? sprintf("%.2f", v) : v} #{k.to_s + (v == 1 ? '' : 's')}"
    end.join(" ")
  end
end

class Time
  include EasyTimer
end