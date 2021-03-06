require 'spec_helper'

describe Authentication do
  subject { build(:authentication) }

  it { should be_valid }
  it { should belong_to(:user) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }

  describe '.find_with_omniauth' do
    before do
      @facebook = create(:authentication_facebook)
      @google = create(:authentication_google)
    end

    it 'should find facebook provider' do
      auth = {
        'provider' => 'facebook',
        'uid' => 'uid_facebook'
      }
      expect(Authentication.find_with_omniauth(auth)).to eql(@facebook)
    end

    it 'should find google provider' do
      auth = {
        'provider' => 'google',
        'uid' => 'uid_google'
      }
      expect(Authentication.find_with_omniauth(auth)).to eql(@google)
    end
  end

  describe '.build_with_omniauth' do
    before do
      @auth = {
        'provider' => 'google',
        'uid' => 'uid_google'
      }
      @authentication = Authentication.build_with_omniauth(@auth)
    end

    it { expect(@authentication.provider).to eql(@auth['provider']) }
    it { expect(@authentication.uid).to eql(@auth['uid']) }
  end
end
