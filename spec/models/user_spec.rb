# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  # Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { is_expected.to allow_value("email@address.foo").for(:email) }
  it { is_expected.to_not allow_value("email").for(:email) }
  it { is_expected.to_not allow_value("email@domain").for(:email) }
  it { is_expected.to_not allow_value("email@domain.").for(:email) }
  it { is_expected.to_not allow_value("email@domain.a").for(:email) }

  # Callbacks
  describe "#set_full_name" do
    it "sets the full_name" do
      expect(create(:user).full_name).to_not be_empty
    end
  end

  # Methods
  describe "#flipper_id" do
    it "returns namespaced id" do
      expect(create(:user).flipper_id).to match /User;/
    end
  end
end
