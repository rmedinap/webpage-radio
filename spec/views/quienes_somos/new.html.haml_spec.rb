require 'spec_helper'

describe "quienes_somos/new" do
  before(:each) do
    assign(:quienes_somos, stub_model(QuienesSomos,
      :descripcion => "MyText",
      :slug => "MyString"
    ).as_new_record)
  end

  it "renders new quienes_somos form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quienes_somos_index_path, "post" do
      assert_select "textarea#quienes_somos_descripcion[name=?]", "quienes_somos[descripcion]"
      assert_select "input#quienes_somos_slug[name=?]", "quienes_somos[slug]"
    end
  end
end
