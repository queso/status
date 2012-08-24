require 'spec_helper'

describe Status do
  describe "#status" do
    it "should return up when up is true" do
      status = Status.new(status: "up", message: "We fixed our database!")
      status.status.should == "up"
    end

    it "should return down when up is false" do
      status = Status.new(status: "down", message: "We b0rked our database!")
      status.status.should == "down"
    end
  end

  describe "#status=" do
    it "should set up to true if passed up" do
      status = Status.new(status: "up", message: "We fixed our database!")
      status.up.should be_true
      status.should be_valid
    end

    it "should set up to false if passed down" do
      status = Status.new(status: "down", message: "Our database is b0rked")
      status.up.should be_false
      status.should be_valid
    end

    it "should not set up to anything if we get anything other than up or down for a status" do
      status = Status.new(status: "WTFBBQ", message: "Our database is b0rked")
      status.should_not be_valid
    end
  end
end
