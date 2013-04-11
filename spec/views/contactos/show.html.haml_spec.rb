require 'spec_helper'

describe "contactos/show" do
  before(:each) do
    @contacto = assign(:contacto, stub_model(Contacto,
      :nombre => "Nombre",
      :email => "Email",
      :mensaje => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
  end
end
