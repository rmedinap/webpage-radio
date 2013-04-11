require 'spec_helper'

describe "programas/new" do
  before(:each) do
    assign(:programa, stub_model(Programa,
      :titulo => "MyString",
      :contenido => "MyText"
    ).as_new_record)
  end

  it "renders new programa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", programas_path, "post" do
      assert_select "input#programa_titulo[name=?]", "programa[titulo]"
      assert_select "textarea#programa_contenido[name=?]", "programa[contenido]"
    end
  end
end
