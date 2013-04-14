require 'spec_helper'

describe "quienes_somos/edit" do
  before(:each) do
    @quienes_somos = assign(:quienes_somos, stub_model(QuienesSomos,
      :descripcion => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders the edit quienes_somos form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quienes_somos_path(@quienes_somos), "post" do
      assert_select "textarea#quienes_somos_descripcion[name=?]", "quienes_somos[descripcion]"
      assert_select "input#quienes_somos_slug[name=?]", "quienes_somos[slug]"
    end
  end
end
