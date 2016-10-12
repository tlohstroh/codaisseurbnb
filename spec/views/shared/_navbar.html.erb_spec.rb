require 'rails_helper'

describe "shared/_navbar.html.erb" do
  before { sign_in user }
  #  test for the shared/_navbar.html.erb file to check that the email is rendered when there is no profile.
  # Otherwise it should render the full name of the user.
  context "without profile" do
    let(:user) { create :user }

    it "renders email" do
      render
      expect(rendered).to have_content user.email
    end
  end

  #test for the shared/_navbar.html.erb file to check that when the user is not signed in,
  # the log in and sign up links get rendered.
  context "with profile" do
    let(:profile) { create :profile }
    let(:user) { create :user, profile: profile }

    it "renders full name" do
      render
      expect(rendered).to have_content profile.first_name
      expect(rendered).to have_content profile.last_name
    end
  end
end