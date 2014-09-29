require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :description => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_description[name=?]", "task[description]"
      assert_select "input#task_category_id[name=?]", "task[category_id]"
    end
  end
end
