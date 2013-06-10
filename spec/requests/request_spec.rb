require 'spec_helper'
require 'factory_girl'

describe "Pagination" do

  context "Page Selection" do

    before(:each) do
      49.times do
        FactoryGirl.create(:user)
      end
      @user1 = User.create(  :first_name   => "Jim",
                            :last_name    => "Smith",
                            :username     => "jimsmith",
                            :email        => "jim@smith.com",
                            :total_karma  => 9000000 )
      
      @user2 = User.create(  :first_name   => "Jim Bob",
                            :last_name    => "Smith",
                            :username     => "jimbobsmith",
                            :email        => "jimbob@smith.com",
                            :total_karma  => 0 ) 
    end

    after(:each) do
      User.delete_all
    end

    it "should display the user with the most karma first" do
      visit root_path
      page.should have_content(@user1.full_name)
    end

    it "should display the user with the least karma last" do
      visit page_path(2)
      page.should have_content(@user2.full_name)
    end

    it "should display users in groups of 50" do
      visit root_path
      page.should have_css("tr", :count => 51)
    end

  end

end
