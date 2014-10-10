require 'spec_helper'

describe "Categories" do
  
  subject { page }
  
  describe "GET /categories" do
    
    before { visit categories_path }
    
    it { should have_content( 'Categories' ) }
    it { should have_title( page_title( 'Categories' ) ) }
    
    
  end
end
