require 'spec_helper'

describe "categorias/new" do
  before(:each) do
    assign(:categoria, stub_model(Categoria,
      :nombre => "MyString"
    ).as_new_record)
  end

  it "renders new categoria form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", categorias_path, "post" do
      assert_select "input#categoria_nombre[name=?]", "categoria[nombre]"
    end
  end
end
