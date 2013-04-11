require 'spec_helper'

describe "djs/show" do
  before(:each) do
    @dj = assign(:dj, stub_model(Dj,
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
  end
end
