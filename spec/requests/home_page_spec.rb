require 'spec_helper'

describe "Home Page" do
  describe "albums list" do
    it "contains message about empty list if there are no albums" do
      visit "/"
      page.should have_content "no albums"
    end
  end
end
