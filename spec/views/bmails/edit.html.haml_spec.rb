require 'spec_helper'

describe "bmails/edit" do
  before(:each) do
    @bmail = assign(:bmail, stub_model(Bmail,
      :to => "MyString",
      :cc => "MyString",
      :bcc => "MyString",
      :subject => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit bmail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bmails_path(@bmail), :method => "post" do
      assert_select "input#bmail_to", :name => "bmail[to]"
      assert_select "input#bmail_cc", :name => "bmail[cc]"
      assert_select "input#bmail_bcc", :name => "bmail[bcc]"
      assert_select "input#bmail_subject", :name => "bmail[subject]"
      assert_select "textarea#bmail_body", :name => "bmail[body]"
    end
  end
end
