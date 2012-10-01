require 'spec_helper'

describe "timer instance" do
	let(:verbose_time){Time.at(694861.111111).verbose}
	it "should return a string" do
		expect(verbose_time.class).to eql String
	end

	it "should be a singular verbose time" do
		expect(verbose_time).to eql "1 week 1 day 1 hour 1 minute 1.11 seconds"
	end

	it "shold be a plural verbose time" do
		expect(Time.at(1389722.22).verbose).to eql "2 weeks 2 days 2 hours 2 minutes 2.22 seconds"	
	end

	it "should show 0.55 seconds" do
		expect(Time.timer{sleep 0.55}.verbose).to eql "0.55 seconds"
	end
end

describe "Timer" do
	before :all do
		@five = Time.timer{sleep 5}
	end

	it "should return a Time object" do
		expect(@five.class).to eql Time
	end

	it "should return 5 seconds" do
		expect(@five.to_f).to be_within(0.1).of(5)
	end
end