require 'spec_helper'

describe "auspiciadores/new" do
  before(:each) do
    assign(:auspiciador, stub_model(Auspiciador,
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new auspiciador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", auspiciadores_path, "post" do
      assert_select "input#auspiciador_link[name=?]", "auspiciador[link]"
    end
  end
end
