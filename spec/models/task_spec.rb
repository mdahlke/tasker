require 'spec_helper'

describe Task do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @task = user.tasks.build(description: "Lorem ipsum")
  end

  subject { @task }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @task.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when user_id is not present" do
    before { @task.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @task.description = " " }
    it { should_not be_valid }
  end
end