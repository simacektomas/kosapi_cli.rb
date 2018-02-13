require 'spec_helper'

RSpec.describe KOSapiCLI::Commands::User do
  let(:proxy) { KOSapiCLI.proxy }
  let(:config) { KOSapiCLI::Configuration.new }
  subject(:user) { KOSapiCLI::Commands::User.new }

  it_behaves_like 'BaseCommand descendat', KOSapiCLI::Commands::User

  describe '#logout' do
    it 'calls KOSapiCLI logout' do
      expect(KOSapiCLI).to receive(:logout)
      user.logout
    end
  end

  describe '#login' do
  end
end
