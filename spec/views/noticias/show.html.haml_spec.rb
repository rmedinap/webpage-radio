require 'spec_helper'

describe "noticias/show" do
  before(:each) do
    @noticia = assign(:noticia, stub_model(Noticia,
      :titulo => "Titulo",
      :contenido => "MyText",
      :autor => "Autor",
      :categoria_id => 1,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Titulo/)
    rendered.should match(/MyText/)
    rendered.should match(/Autor/)
    rendered.should match(/1/)
    rendered.should match(/Slug/)
  end
end
