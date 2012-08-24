require 'spec_helper'

describe StatusesController do

  describe "POST #create" do
    def post_create(options = {status: "UP", message: "Back up after ec2 went down"})
      post :create, options
    end

    it "should create a status when both status and message are given" do
      lambda do
        post_create
      end.should change(Status, :count).by(1)
    end

    it "should not create a status when just message is given" do
      lambda do
        post_create(status: nil)
      end.should_not change(Status, :count).by(1)
    end

    it "should create a status when just status is given" do
      lambda do
        post_create(status: "DOWN", message: nil)
      end.should change(Status, :count).by(1)
    end

    it "should return 200 on success" do
      post_create
      response.should be_success
    end
  end

  describe "PUT #update" do

    before do
      @status = Status.create(status: "up", message: "All systems normal")
    end

    it "should update the message" do
      put :update, id: @status.id, message: "Oops, we did it again"
      @status.reload.message.should == "Oops, we did it again"
    end
  end

end
