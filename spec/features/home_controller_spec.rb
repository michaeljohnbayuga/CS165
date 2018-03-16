require 'rails_helper'
require 'spec_helper'

describe "Home Controller" do

  it "should visit home if logged in" do
    user = User.create(:name => "user", :username => "user", :password => "user")
    current = User.select(:username => "user")
    page.set_rack_session(user_id: user.id)
    visit "/"
    expect(page).to have_content("Hi, " + user.name + "!")
  end

  it "should visit shows if not logged in" do
    visit "/"
    expect(page).to have_content("Log In")
  end

end
