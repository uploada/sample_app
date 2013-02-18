require 'spec_helper'

describe "Static Pages" do

  describe "home page" do
    
     it "should have the h1 'Sample App'" do
	 
	visit '/static_pages/home'
	page.should have_selector('h1', :text => 'Sample App')
 			
     end

     it "should have the title 'home'" do

        visit '/static_pages/home'
        page.should have_selector('title', 
                        :text => "Ruby on Rails Tutorial Sample App | Home")
     end
  end
end

describe "Static Pages" do

  describe "help page" do
    
     it "should have the h1 'Help'" do
	 
	visit '/static_pages/help'
	page.should have_selector('h1', :text => 'Help')
     end
     
     it "should have the title 'help'" do

        visit '/static_pages/help'
        page.should have_selector('title', 
                        :text => "Ruby on Rails Tutorial Sample App | Help")
     end
  end
end

describe "Static Pages" do

  describe "about page" do
    
     it "should have the h1 'About'" do
	 
	visit '/static_pages/about'
	page.should have_selector('h1', :text => 'About')
     end
     
     it "should have the title about" do

        visit '/static_pages/about'
        page.should have_selector('title', 
                        :text => "Ruby on Rails Tutorial Sample App | About")
     end
  end
end


