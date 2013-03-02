require 'spec_helper'

describe "MicropostPages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do
      
      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end
  
      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end
  
    describe "with valid information" do
   
      before { fill_in 'micropost_content', with: 'Lorem ipsum' }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end 
    end

    describe "as an incorrect user" do
      
      let(:other_user) { FactoryGirl.create(:user) }
      
      let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "current user's micropost") }
      let!(:m2) { FactoryGirl.create(:micropost, user: other_user, content: "other user's micropost") }

      before do

        visit root_path

      end
     
      it { should_not have_link('delete', href: "/microposts/#{m2.id}") }
      it { should have_link('delete', href: "/microposts/#{m1.id}") }
    end

  end
 
  describe "micropost counts and proper pluralization for several microposts" do
    before { FactoryGirl.create(:micropost, user: user) }
    before { FactoryGirl.create(:micropost, user: user) }
    before { visit root_path }
     
    it "should count 2 microposts" do
      should have_content('2 microposts')
    end  
  end

  describe "micropost counts and proper pluralization for single micropost" do
    before { FactoryGirl.create(:micropost, user: user) }
    before { visit root_path }
     
    it "should count 1 micropost" do
      should have_content('1 micropost')
    end  
  end

  describe "micropost pagination" do
    
    before(:all) { 30.times { FactoryGirl.create(:micropost, user: user) } }
    after(:all) { User.delete_all }

    specify { user.microposts.count.should == 30 }

   before { visit root_path } 
  
    it { should have_selector('div.pagination') } 
  end  
 
end
