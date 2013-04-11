require 'spec_helper'

describe "auspiciadores/show" do
  before(:each) do
    @auspiciador = assign(:auspiciador, stub_model(Auspiciador,
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link/)
  end
end
