require 'spec_helper'

describe "diapositivas/show" do
  before(:each) do
    @diapositiva = assign(:diapositiva, stub_model(Diapositiva,
      :pie_de_foto => "Pie De Foto"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pie De Foto/)
  end
end
