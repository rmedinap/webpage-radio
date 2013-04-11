require 'spec_helper'

describe "soundclouds/edit" do
  before(:each) do
    @soundcloud = assign(:soundcloud, stub_model(Soundcloud,
      :link => "MyString"
    ))
  end

  it "renders the edit soundcloud form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", soundcloud_path(@soundcloud), "post" do
      assert_select "input#soundcloud_link[name=?]", "soundcloud[link]"
    end
  end
end
