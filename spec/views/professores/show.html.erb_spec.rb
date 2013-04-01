require 'spec_helper'

describe "professores/show" do
  before(:each) do
    @professor = assign(:professor, stub_model(Professor,
      :nome => "Nome",
      :graduacao => "Graduacao",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Graduacao/)
    rendered.should match(/Email/)
  end
end
