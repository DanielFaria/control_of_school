require 'spec_helper'

describe "professores/edit" do
  before(:each) do
    @professor = assign(:professor, stub_model(Professor,
      :nome => "MyString",
      :graduacao => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit professor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", professor_path(@professor), "post" do
      assert_select "input#professor_nome[name=?]", "professor[nome]"
      assert_select "input#professor_graduacao[name=?]", "professor[graduacao]"
      assert_select "input#professor_email[name=?]", "professor[email]"
    end
  end
end
