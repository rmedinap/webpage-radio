require 'spec_helper'

describe "soundclouds/show" do
  before(:each) do
    @soundcloud = assign(:soundcloud, stub_model(Soundcloud,
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link/)
  end
end
