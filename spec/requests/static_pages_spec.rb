require 'spec_helper'

describe "Static pages" do 

	describe "Home page" do

		it "should have the h1 'Sample App'" do
			visit '/static_pages/home'
			page.should have_selector('h1', :text=>'Sample App')
		end
	end
end