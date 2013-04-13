require 'spec_helper'

describe "diapositivas/new" do
  before(:each) do
    assign(:diapositiva, stub_model(Diapositiva,
      :pie_de_foto => "MyString"
    ).as_new_record)
  end

  it "renders new diapositiva form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diapositivas_path, "post" do
      assert_select "input#diapositiva_pie_de_foto[name=?]", "diapositiva[pie_de_foto]"
    end
  end
end
