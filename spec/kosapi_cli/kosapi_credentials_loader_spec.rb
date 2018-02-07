RSpec.describe KOSapiCLI::KOSapiCredentialsLoader do
  let(:id_output) { "Client ID (KOSAPI_OAUTH_CLIENT_ID):\n" }
  let(:secret_output) { "Client secret (KOSAPI_OAUTH_CLIENT_SECRET):\n" }

  subject(:loader) do
    KOSapiCLI::KOSapiCredentialsLoader.new
  end

  describe '#ask_client_id' do
    it 'shows label client_id to user' do
      expect do
        simulate_stdin('id') { loader.ask_client_id }
      end.to output(id_output).to_stdout
    end

    context 'string "id" as input' do
      before(:all) { silence_output }
      after(:all) { enable_output }
      let(:input) { 'id' }

      it 'returns inputed client_id' do
        simulate_stdin(input) do
          expect(loader.ask_client_id).to eq input
        end
      end

      it 'stores inputed client_id to local var' do
        simulate_stdin(input) do
          loader.ask_client_id
          expect(loader.id).to eq input
        end
      end
    end
  end

  describe '#ask_client_secret' do
    it 'shows label client_secret to user' do
      expect do
        simulate_stdin('secret') { loader.ask_client_secret }
      end.to output(secret_output).to_stdout
    end

    context 'string "secret" as input' do
      before(:all) { silence_output }
      after(:all) { enable_output }
      let(:input) { 'secret' }

      it 'returns inputed client_secret' do
        simulate_stdin(input) do
          expect(loader.ask_client_secret).to eq input
        end
      end

      it 'stores inputed client_secret to local var' do
        simulate_stdin(input) do
          loader.ask_client_secret
          expect(loader.secret).to eq input
        end
      end
    end
  end

  describe '#credentials' do
    context 'only id is set' do
      before(:each) { loader.id = 'id' }

      it 'return nil' do
        expect(loader.credentials).to be_nil
      end
    end

    context 'only secret set' do
      before(:each) { loader.secret = 'secret' }

      it 'return nil' do
        expect(loader.credentials).to be_nil
      end
    end

    context 'id and secret set' do
      before(:each) do
        loader.id = 'id'
        loader.secret = 'secret'
      end

      it 'returns credentials hash' do
        expect(loader.credentials).to be_a Hash
      end

      it 'contains stored data' do
        expect(loader.credentials[:client_id]).to eq 'id'
        expect(loader.credentials[:client_secret]).to eq 'secret'
      end
    end
  end
end
