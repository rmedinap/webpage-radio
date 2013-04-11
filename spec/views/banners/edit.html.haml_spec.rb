require 'spec_helper'

describe "banners/edit" do
  before(:each) do
    @banner = assign(:banner, stub_model(Banner,
      :pie_de_foto => "MyString"
    ))
  end

  it "renders the edit banner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", banner_path(@banner), "post" do
      assert_select "input#banner_pie_de_foto[name=?]", "banner[pie_de_foto]"
    end
  end
end
