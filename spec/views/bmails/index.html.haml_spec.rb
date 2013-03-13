require 'spec_helper'

describe "bmails/index" do
  before(:each) do
    assign(:bmails, [
      stub_model(Bmail,
        :to => "To",
        :cc => "Cc",
        :bcc => "Bcc",
        :subject => "Subject",
        :body => "MyText"
      ),
      stub_model(Bmail,
        :to => "To",
        :cc => "Cc",
        :bcc => "Bcc",
        :subject => "Subject",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of bmails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To".to_s, :count => 2
    assert_select "tr>td", :text => "Cc".to_s, :count => 2
    assert_select "tr>td", :text => "Bcc".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
