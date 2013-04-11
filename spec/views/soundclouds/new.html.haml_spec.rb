require 'spec_helper'

describe "soundclouds/new" do
  before(:each) do
    assign(:soundcloud, stub_model(Soundcloud,
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new soundcloud form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", soundclouds_path, "post" do
      assert_select "input#soundcloud_link[name=?]", "soundcloud[link]"
    end
  end
end
