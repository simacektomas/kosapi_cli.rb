RSpec.describe KOSapiCLI::KOSapiClientProxy do
  subject(:proxy) { KOSapiCLI::KOSapiClientProxy.new }
  before do
    KOSapiClient.reset
  end

  describe '.parameters' do
    it 'returns an array' do
      expect(proxy.class.parameters).to be_an Array
    end

    it 'returns parameters that can be set' do
      expect(proxy.class.parameters.empty?).to be false
    end
  end

  describe '#setup_resource' do
    it 'set resource on KOSapiClient' do
      expect(KOSapiClient).to receive(:exams)
      proxy.setup_resource('exams')
    end
  end

  describe '#send_request' do
    context 'resource was set before' do
      before(:each) { proxy.setup_resource('exams') }
      let(:params) do
        { id: 198,
          offset: 2,
          limit: 1 }
      end

      it 'sets all parrams in params array' do
        proxy.class.parameters.each do |param|
          expect(proxy).to receive("setup_#{param}").with(params[param])
        end
        expect { proxy.send_request(params) }.to raise_error RuntimeError
      end

      it 'raise error because credentials are not set' do
        expect { proxy.send_request(params) }.to raise_error RuntimeError
      end
    end

    context 'resource is not set' do
      it 'raise error because resource was not set' do
        expect { proxy.send_request }.to raise_error RuntimeError
      end
    end
  end

  describe '#parse_kosapi_exception' do
    context 'passing OAuth2::Error exception' do
      let(:message) do
        ": \n<?xml version=\"1.0\" encoding=\"UTF-8\"\
standalone=\"yes\"?><error><desc>bar</desc></error>"
      end

      let(:hash) do
        { desc: 'bar' }
      end

      it 'return hash the xml response from KOSapi' do
        expect(proxy.parse_kosapi_exception(message)).to be_a Hash
      end

      it 'parses all elements' do
        expect(proxy.parse_kosapi_exception(message)).to eq hash
      end
    end
  end
end
