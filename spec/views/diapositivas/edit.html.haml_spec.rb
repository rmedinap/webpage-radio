require 'spec_helper'

describe "diapositivas/edit" do
  before(:each) do
    @diapositiva = assign(:diapositiva, stub_model(Diapositiva,
      :pie_de_foto => "MyString"
    ))
  end

  it "renders the edit diapositiva form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diapositiva_path(@diapositiva), "post" do
      assert_select "input#diapositiva_pie_de_foto[name=?]", "diapositiva[pie_de_foto]"
    end
  end
end
