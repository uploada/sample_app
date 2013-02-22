require 'spec_helper'

describe "User pages" do

  subject { page }
  
  describe "signup page" do
    before { visit signup_path }
  
    it { should have_selector 'h1', text: 'Sign up' }
    it { should have_selector 'title', text: full_title('Sign up') }
  end


  describe "check up creating one user" do
  
     # code to make a user variable
     
     #user = User.find(24) 
     let(:user) { FactoryGirl.create(:user)}
     before { visit user_path(user) }
   
     it { should have_selector 'h1', text: user.name }
     it { should have_selector 'title', text: user.name }
  end


  describe "signup" do
    before { visit signup_path }

    let(:submit) { "create my account" }
  
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "afte submission" do
        before { click_button submit }
  
        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') } 
      end
 
    end
 
    describe "with valid information" do
      before do
        fill_in "Name",		with: "uploada"
        fill_in "Email", 	with: "loadaup2@gmail.com"
	fill_in "Password", 	with: "aaaaaa"
	fill_in "Confirmation",	with: "aaaaaa"

      end
     
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
   
    describe "checking if after creating the user it flashes the welcome message" do
      before do
        fill_in "Name",		with: "uploada2"
        fill_in "Email", 	with: "loadaup2@gmail.com"
	fill_in "Password", 	with: "aaaaaa"
	fill_in "Confirmation",	with: "aaaaaa"

        click_button submit
      end
       
      let(:user) { User.find_by_email('loadaup2@gmail.com') }
      it { should have_selector('title', text: user.name) }
      #it { should have_selector('div.alert.alert-success', text: 'Welcome') } 
      it { should have_selector('div.alert.alert-success', text: 'welcome') }
    end
  end
end
