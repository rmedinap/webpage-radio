require 'spec_helper'

describe "noticias/edit" do
  before(:each) do
    @noticia = assign(:noticia, stub_model(Noticia,
      :titulo => "MyString",
      :contenido => "MyText",
      :autor => "MyString",
      :categoria_id => 1,
      :slug => "MyString"
    ))
  end

  it "renders the edit noticia form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", noticia_path(@noticia), "post" do
      assert_select "input#noticia_titulo[name=?]", "noticia[titulo]"
      assert_select "textarea#noticia_contenido[name=?]", "noticia[contenido]"
      assert_select "input#noticia_autor[name=?]", "noticia[autor]"
      assert_select "input#noticia_categoria_id[name=?]", "noticia[categoria_id]"
      assert_select "input#noticia_slug[name=?]", "noticia[slug]"
    end
  end
end
