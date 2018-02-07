RSpec.describe KOSapiCLI::Configuration do
  subject(:config) do
    KOSapiCLI::Configuration.new(opt)
  end

  describe 'initialization' do
    context 'empty hash' do
      let(:opt) { {} }
      it 'property env_file has default value' do
        expect(config.env_file).to match(/.kosapi_cli.env/)
      end
    end

    context 'custom hash' do
      let(:opt) { { env_file: '/path/env_file' } }
      it 'property env_file has custom value' do
        expect(config.env_file).to eq '/path/env_file'
      end
    end
  end

  describe 'value set' do
    let(:opt) { {} }
    it 'stores path to env_file property' do
      config.env_file = '/path/to/file'
      expect(config.env_file).to eq '/path/to/file'
    end
  end
end
