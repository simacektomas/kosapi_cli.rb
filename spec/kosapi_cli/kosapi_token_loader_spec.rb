RSpec.describe KOSapiCLI::KOSapiTokenLoader do
  let(:broken) do
    { 'broken' => { 'env' => 'file' } }
  end

  let(:valid) do
    { 'config' => { 'client_token' => { 'access_token' => 'fas4f68sef486sef4',
                                        'refresh_token' => '',
                                        'expires_at' => (Time.now.to_i + 1000),
                                        'token_type' => 'bearer',
                                        'scope' => 'cvut:kosapi:read' } } }
  end

  let(:invalid) do
    { 'config' => { 'client_token' => { 'access_token' => 'fas4f68sef486sef4',
                                        'refresh_token' => '',
                                        'expires_at' => (Time.now.to_i - 1000),
                                        'token_type' => 'bearer',
                                        'scope' => 'cvut:kosapi:read' } } }
  end

  let(:config) do
    KOSapiCLI::Configuration.new(env_file: '/tmp/.kosapi_cli.env')
  end

  subject(:loader) do
    KOSapiCLI::KOSapiTokenLoader.new(config)
  end

  describe '#restore_token' do
    context '.kosapi_cli.env does not file exist' do
      it 'should try to read from .env file' do
        expect(File).to receive(:open).with(config.env_file, 'r')
        loader.restore_token
      end

      it 'should return nil if env file does not exist' do
        expect(loader.restore_token).to be_nil
      end
    end

    context '.kosapi_cli.env does exists but contains not valid data' do
      before(:each) { write_yaml_env(config.env_file, broken) }
      after(:each) { File.delete(config.env_file) }

      it 'should read from .env file' do
        expect(File).to receive(:open).with(config.env_file, 'r')
        loader.restore_token
      end

      it 'should return nil if env file is broken' do
        expect(loader.restore_token).to be_nil
      end
    end

    context 'valid token in .kosapi_cli.env file' do
      before(:each) { write_yaml_env(config.env_file, valid) }
      after(:each) { File.delete(config.env_file) }

      it 'should read from .env file' do
        expect(File).to receive(:open).with(config.env_file, 'r')
        loader.restore_token
      end

      it 'should return hash' do
        expect(loader.restore_token).to be_a Hash
      end

      it 'should contain stored data' do
        expect(loader.restore_token).to eq valid['config']['client_token']
      end
    end

    context 'invalid token in .kosapi_cli.env file' do
      before(:each) { write_yaml_env(config.env_file, invalid) }
      after(:each) { File.delete(config.env_file) }

      it 'should read from .env file' do
        expect(File).to receive(:open).with(config.env_file, 'r')
        loader.restore_token
      end

      it 'should return nil if token is not valid' do
        expect(loader.restore_token).to be_nil
      end
    end
  end

  describe '#store_token' do
    context '.kosapi_cli.env does not exists' do
      it 'should read and write into env file' do
        expect(File).to receive(:open).with(config.env_file, 'r')
        expect(File).to receive(:open).with(config.env_file, 'w')
        loader.store_token(valid['config']['client_token'])
      end

      it 'should create env file' do
        expect(File.file?(config.env_file)).to be false
        loader.store_token(valid['config']['client_token'])
        expect(File.file?(config.env_file)).to be true
      end

      it 'should store data that was given' do
        loader.store_token(valid['config']['client_token'])
        test = {}
        File.open(config.env_file, 'r') do |f|
          test = YAML.safe_load(f)
        end
        expect(valid['config']['client_token']).to eq(test['config']['client_token'])
      end
    end

    context '.kosapi_cli.env does already exists' do
      before(:each) { write_yaml_env(config.env_file, valid) }
      after(:each) { File.delete(config.env_file) }

      it 'should read and write into env file' do
        expect(File).to receive(:open).with(config.env_file, 'r')
        expect(File).to receive(:open).with(config.env_file, 'w')
        loader.store_token(valid['config']['client_token'])
      end

      it 'should store data that was given' do
        loader.store_token(valid['config']['client_token'])
        test = {}
        File.open(config.env_file, 'r') do |f|
          test = YAML.safe_load(f)
        end
        expect(valid['config']['client_token']).to eq(test['config']['client_token'])
      end
    end
  end
end
