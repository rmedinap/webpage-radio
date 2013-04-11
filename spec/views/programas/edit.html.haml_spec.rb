require 'spec_helper'

describe "programas/edit" do
  before(:each) do
    @programa = assign(:programa, stub_model(Programa,
      :titulo => "MyString",
      :contenido => "MyText"
    ))
  end

  it "renders the edit programa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", programa_path(@programa), "post" do
      assert_select "input#programa_titulo[name=?]", "programa[titulo]"
      assert_select "textarea#programa_contenido[name=?]", "programa[contenido]"
    end
  end
end
