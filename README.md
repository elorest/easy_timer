# EasyTimer

A simple and elegant way to add timer functionality to your projects. Adds class method :timer and instance method :verbose to Time class.

## Installation

Add this line to your application's Gemfile:

    gem 'easy_timer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_timer

## Usage
Calling timer will return a time object.
		
    Time.timer{sleep 1} #=> Time object

Calling verbose on a Time instance will return a formatted string.
		
    Time.timer{sleep 1}.verbose #=> 1.00 seconds
    Time.at(1.weeks + 1.days + 1.hours + 1.minutes + 1.11.seconds) #=> "1 weeks 1 days 1 hours 1 minutes 1.11 seconds"
    Time.at(694861.11) #=> "1 weeks 1 days 1 hours 1 minutes 1.11 seconds"

You can also pass :v => true or :verbose => true.
		
    Time.timer(:v => true){sleep 1} #=> 1.00 seconds

A practical usage would be:

    puts Time.timer do
     Model.update_all({:criteria => false}, {:criteria => true})
     puts "All models with criteria=false have been updated."
    end.verbose


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
