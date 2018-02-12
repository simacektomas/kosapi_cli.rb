RSpec.describe KOSapiCLI do
  before do
    @proxy = KOSapiCLI.proxy
  end

  it 'has a version number' do
    expect(KOSapiCLI::VERSION).not_to be nil
  end

  describe '.proxy' do
    it 'provide proxy instance via reader' do
      expect(KOSapiCLI.proxy).to eq @proxy
    end
  end

  it 'delegates missing methods to stored proxy instance' do
    expect(@proxy).to receive(:setup_resource).with('foo')
    KOSapiCLI.setup_resource('foo')
  end

  it 'handles missing methods not defined on proxy' do
    expect { KOSapiCLI.foo }.to raise_error NoMethodError
  end

  it 'responds to proxy methods' do
    allow(@proxy).to receive(:foo)
    expect(KOSapiCLI).to respond_to(:foo)
  end
end
