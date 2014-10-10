require 'spec_helper'

describe "Tasks" do

  subject { page }
  
  describe "Tasks page" do
    before { visit root_path }
    
    it { should have_content( 'Tasks' ) }
    it { should_not have_title( page_title('Tasks') ) }
    
  end
end
