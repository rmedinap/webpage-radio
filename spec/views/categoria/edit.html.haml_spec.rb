require 'spec_helper'

describe "categoria/edit" do
  before(:each) do
    @categorium = assign(:categorium, stub_model(Categorium,
      :nombre => "MyString"
    ))
  end

  it "renders the edit categorium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", categorium_path(@categorium), "post" do
      assert_select "input#categorium_nombre[name=?]", "categorium[nombre]"
    end
  end
end
