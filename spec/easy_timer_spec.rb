require 'spec_helper'

describe "timer instance" do
  let(:verbose_time){Time.at(694861.111111).verbose}
  it "should return a string" do
    (verbose_time.class).should eql String
  end

  it "should be a singular verbose time" do
    (verbose_time).should eql "1 week 1 day 1 hour 1 minute 1 second"
  end

  it "should be a plural verbose time" do
    Time.at(1389722.22).verbose.should eql "2 weeks 2 days 2 hours 2 minutes 2 seconds"
  end

  it "should display 3 decimal places" do
    (Time.at(22.222).verbose).should eql "22.222 seconds"
  end

  it "should display 2 decimal places" do
    (Time.at(60.222).verbose).should eql "1 minute 0.22 seconds"
  end

  it "should display no decimal places" do
    (Time.at(361.222).verbose).should eql "6 minutes 1 second"
  end
end

describe "Timer" do
  before :all do
    @two = Time.timer{sleep 2}
  end

  it "should return a Time object" do
    (@two.class).should eql Time

  it "should return 2 seconds" do
    (@two.to_f).should be_within(0.1).of(2)
  end
end
