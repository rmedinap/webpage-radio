require 'spec_helper'

describe "auspiciadores/edit" do
  before(:each) do
    @auspiciador = assign(:auspiciador, stub_model(Auspiciador,
      :link => "MyString"
    ))
  end

  it "renders the edit auspiciador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", auspiciador_path(@auspiciador), "post" do
      assert_select "input#auspiciador_link[name=?]", "auspiciador[link]"
    end
  end
end
