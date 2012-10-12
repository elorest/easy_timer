require 'spec_helper'

describe "timer instance" do
	let(:verbose_time){Time.at(694861.111111).verbose}
	it "should return a string" do
		expect(verbose_time.class).to eql String
	end

	it "should be a singular verbose time" do
		expect(verbose_time).to eql "1 week 1 day 1 hour 1 minute 1 second"
	end

	it "should be a plural verbose time" do
		expect(Time.at(1389722.22).verbose).to eql "2 weeks 2 days 2 hours 2 minutes 2 seconds"
	end

	it "should display 3 decimal places" do
		expect(Time.at(22.222).verbose).to eql "22.222 seconds"
	end

	it "should display 2 decimal places" do
		expect(Time.at(60.222).verbose).to eql "1 minute 0.22 seconds"
	end

	it "should display no decimal places" do
		expect(Time.at(361.222).verbose).to eql "6 minutes 1 second"
	end
end

describe "Timer" do
	before :all do
		@five = Time.timer{sleep 2}
	end

	it "should return a Time object" do
		expect(@five.class).to eql Time
	end

	it "should return 2 seconds" do
		expect(@five.to_f).to be_within(0.1).of(2)
	end
end