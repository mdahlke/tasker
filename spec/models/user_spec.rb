require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }
  
  it { should respond_to(:tasks) }
  
  describe "task associations" do

    before { @user.save }
    let!(:older_task) do
      FactoryGirl.create(:task, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_task) do
      FactoryGirl.create(:task, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right tasks in the right order" do
      expect(@user.tasks.to_a).to eq [newer_task, older_task]
    end
  end
  
end