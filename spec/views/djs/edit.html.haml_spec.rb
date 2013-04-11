require 'spec_helper'

describe "djs/edit" do
  before(:each) do
    @dj = assign(:dj, stub_model(Dj,
      :nombre => "MyString"
    ))
  end

  it "renders the edit dj form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dj_path(@dj), "post" do
      assert_select "input#dj_nombre[name=?]", "dj[nombre]"
    end
  end
end
