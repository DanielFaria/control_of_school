require 'spec_helper'

describe "professores/new" do
  before(:each) do
    assign(:professor, stub_model(Professor,
      :nome => "MyString",
      :graduacao => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new professor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", professores_path, "post" do
      assert_select "input#professor_nome[name=?]", "professor[nome]"
      assert_select "input#professor_graduacao[name=?]", "professor[graduacao]"
      assert_select "input#professor_email[name=?]", "professor[email]"
    end
  end
end