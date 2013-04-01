require 'spec_helper'

describe "alunos/show" do
  before(:each) do
    @aluno = assign(:aluno, stub_model(Aluno,
      :nome => "Nome",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Email/)
  end
end
