require 'easy_timer'
require 'minitest/autorun'
require 'minitest/pride'

describe "timer instance" do
  let(:verbose_time){Time.at(694861.111111).verbose}
  it "should return a string" do
    verbose_time.must_be_instance_of String
  end

  it "should be a singular verbose time" do
    (verbose_time).must_equal "1 week 1 day 1 hour 1 minute 1 second"
  end

  it "should be a plural verbose time" do
    Time.at(1389722.22).verbose.must_equal "2 weeks 2 days 2 hours 2 minutes 2 seconds"
  end

  it "should display 3 decimal places" do
    (Time.at(22.222).verbose).must_equal "22.222 seconds"
  end

  it "should display 2 decimal places" do
    (Time.at(60.222).verbose).must_equal "1 minute 0.22 seconds"
  end

  it "should display no decimal places" do
    (Time.at(361.222).verbose).must_equal "6 minutes 1 second"
  end
end

describe "Timer" do
  before :all do
    @two = Time.timer{sleep 2}
  end

  it "should return a Time object" do
    (@two).must_be_instance_of Time
  end

  it "should return 2 seconds" do
    (@two.to_f).must_be_within_delta 2, 0.1
  end
end
