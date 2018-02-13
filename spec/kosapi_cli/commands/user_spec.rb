RSpec.describe KOSapiCLI::Commands::User do
  let(:proxy) { KOSapiCLI.proxy }
  let(:config) { KOSapiCLI::Configuration.new }
  subject(:user) { KOSapiCLI::Commands::User.new }

  it 'changes the default desription' do
    expect(user.class.description).to_not eq user.class.superclass.description
  end

  describe '#logout' do
    it 'calls KOSapiCLI logout' do
      expect(KOSapiCLI).to receive(:logout)
      user.logout
    end
  end

  describe '#login' do
  end
end
