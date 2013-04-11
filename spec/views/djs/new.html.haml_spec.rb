require 'spec_helper'

describe "djs/new" do
  before(:each) do
    assign(:dj, stub_model(Dj,
      :nombre => "MyString"
    ).as_new_record)
  end

  it "renders new dj form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", djs_path, "post" do
      assert_select "input#dj_nombre[name=?]", "dj[nombre]"
    end
  end
end
