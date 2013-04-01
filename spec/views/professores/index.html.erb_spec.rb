require 'spec_helper'

describe "professores/index" do
  before(:each) do
    assign(:professores, [
      stub_model(Professor,
        :nome => "Nome",
        :graduacao => "Graduacao",
        :email => "Email"
      ),
      stub_model(Professor,
        :nome => "Nome",
        :graduacao => "Graduacao",
        :email => "Email"
      )
    ])
  end

  it "renders a list of professores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Graduacao".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
