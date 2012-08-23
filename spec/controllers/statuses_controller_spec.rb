require 'spec_helper'

describe StatusesController do

  describe "POST #create" do
    def post_create(options = {up: true, message: "Back up after ec2 went down"})
      post :create, options
    end

    it "should create a status when both up and message are given" do
      lambda do
        post_create
      end.should change(Status, :count).by(1)
    end

    it "should create a status when just message is given" do
      lambda do
        post_create(up: nil)
      end.should change(Status, :count).by(1)
    end

    it "should create a status when just up is given" do
      lambda do
        post_create(message: nil)
      end.should change(Status, :count).by(1)
    end

    it "should return 200 on success" do
      post_create
      response.should be_success
    end
  end

  describe "PUT #update" do

    before do
      @status = Status.create(up: true, message: "All systems normal")
    end

    it "should update the message" do
      put :update, id: @status.id, message: "Oops, we did it again"
      @status.reload.message.should == "Oops, we did it again"
    end
  end

end
