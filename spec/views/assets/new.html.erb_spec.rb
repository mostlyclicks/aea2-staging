require 'spec_helper'

describe "assets/new" do
  before(:each) do
    assign(:asset, stub_model(Asset,
      :name => "MyString",
      :description => "MyText",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assets_path, :method => "post" do
      assert_select "input#asset_name", :name => "asset[name]"
      assert_select "textarea#asset_description", :name => "asset[description]"
      assert_select "input#asset_category_id", :name => "asset[category_id]"
    end
  end
end
