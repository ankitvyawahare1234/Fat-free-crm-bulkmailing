require 'spec_helper'

describe "bmails/show" do
  before(:each) do
    @bmail = assign(:bmail, stub_model(Bmail,
      :to => "To",
      :cc => "Cc",
      :bcc => "Bcc",
      :subject => "Subject",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/To/)
    rendered.should match(/Cc/)
    rendered.should match(/Bcc/)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
  end
end
