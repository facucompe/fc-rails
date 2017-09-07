require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  describe '#generate_verification_code' do
    context 'When the user is created' do
      let(:user) { create(:user) }

      it 'generates a random verification code' do
        expect(user.verification_code).to be_present
      end
    end
  end
end
