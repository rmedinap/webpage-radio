require 'spec_helper'

describe "diapositivas/index" do
  before(:each) do
    assign(:diapositivas, [
      stub_model(Diapositiva,
        :pie_de_foto => "Pie De Foto"
      ),
      stub_model(Diapositiva,
        :pie_de_foto => "Pie De Foto"
      )
    ])
  end

  it "renders a list of diapositivas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pie De Foto".to_s, :count => 2
  end
end
