require 'spec_helper'

describe "contactos/edit" do
  before(:each) do
    @contacto = assign(:contacto, stub_model(Contacto,
      :nombre => "MyString",
      :email => "MyString",
      :mensaje => "MyText"
    ))
  end

  it "renders the edit contacto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contacto_path(@contacto), "post" do
      assert_select "input#contacto_nombre[name=?]", "contacto[nombre]"
      assert_select "input#contacto_email[name=?]", "contacto[email]"
      assert_select "textarea#contacto_mensaje[name=?]", "contacto[mensaje]"
    end
  end
end
