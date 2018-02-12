RSpec.describe KOSapiCLI::Authentication do
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
  # Testing authentication module in context
  # of KOSapiCLI singleton, it uses it's mehotds.
  subject(:cli) { KOSapiCLI }

  before do
    @config = KOSapiCLI::Configuration.new
  end

  describe '.logout' do
    context '.env file does not exist' do
      it 'return false if file was not deleted' do
        expect(subject.logout).to be false
      end
    end

    context '.env file does exist' do
      before(:each) { write_yaml_env(@config.env_file, 'foo' => 'bar') }

      it 'returns true if file was deleted' do
        expect(subject.logout).to be true
      end

      it 'delete the file' do
        subject.logout
        expect(File.file?(@config.env_file)).to be false
      end
    end
  end

  describe '.initialize_token' do
    context '.env file does not exist' do
      it 'return false' do
        expect(subject.initialize_token).to be false
      end
    end

    context '.env file does exists, invalid token' do
      before(:each) { write_yaml_env(@config.env_file, invalid) }
      after(:each) { subject.logout }

      it 'return false' do
        expect(subject.initialize_token).to be false
      end
    end

    context '.env file does exists, valid token' do
      before(:each) { write_yaml_env(@config.env_file, valid) }
      after(:each) { subject.logout }

      it 'return true' do
        expect(subject.initialize_token).to be true
      end

      it 'configure KOSapiClient' do
        expect(KOSapiClient).to receive(:configure)
        subject.initialize_token
      end
    end
  end

  describe '.login' do
    context 'invalid credentials given by params' do
      it 'raise OAuth2::Error error' do
        expect { subject.login('id', 'secret') }.to raise_error OAuth2::Error
      end

      it 'it configure KOSapiClient' do
        expect(KOSapiClient).to receive(:configure)
        expect { subject.login('id', 'secret') }.to raise_error OAuth2::Error
      end
    end

    context 'no credentials given, read invalid creds from stdin' do
      before(:all) { silence_output }
      after(:all) { enable_output }

      it 'raise OAuth2::Error error' do
        expect do
          simulate_stdin('id', 'secret') { subject.login }
        end.to raise_error OAuth2::Error
      end

      it 'configure KOSapiClient' do
        expect(KOSapiClient).to receive(:configure)
        expect do
          simulate_stdin('id', 'secret') { subject.login }
        end.to raise_error OAuth2::Error
      end
    end
  end
end
