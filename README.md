# EasyTimer

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'easy_timer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_timer

## Usage
Calling timer will return a time object.
		$ Time.timer{sleep 1} #=> Time object

Calling verbose on a Time object will return a formatted string.
		$ Time.timer{sleep 1}.verbose #=> 1.00 seconds

You can also pass :v => true or :verbose => true.
		$ Time.timer(:v => true){sleep 1} #=> 1.00 seconds


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
