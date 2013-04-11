require 'spec_helper'

describe "banners/new" do
  before(:each) do
    assign(:banner, stub_model(Banner,
      :pie_de_foto => "MyString"
    ).as_new_record)
  end

  it "renders new banner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", banners_path, "post" do
      assert_select "input#banner_pie_de_foto[name=?]", "banner[pie_de_foto]"
    end
  end
end
