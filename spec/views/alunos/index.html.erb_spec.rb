require 'spec_helper'

describe "alunos/index" do
  before(:each) do
    assign(:alunos, [
      stub_model(Aluno,
        :nome => "Nome",
        :email => "Email"
      ),
      stub_model(Aluno,
        :nome => "Nome",
        :email => "Email"
      )
    ])
  end

  it "renders a list of alunos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
