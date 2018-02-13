RSpec.describe KOSapiCLI::Commands::Output do
  let(:out) { KOSapiCLI::Commands::Output }

  before(:each) do
    @object = Object
    @object.extend(KOSapiCLI::Commands::Output)
  end

  [:valid_token,
   :invalid_token].each do |method|
    describe ".#{method}" do
      context 'verbose' do
        let(:v) { true }
        it 'prints info message to STDERR' do
          expect { @object.send(method, v) }.to output(/INFO/).to_stderr
        end
      end

      context 'silent' do
        let(:v) { false }
        it 'prints nothing' do
          expect { @object.send(method, v) }.to_not output.to_stderr
        end
      end
    end
  end

  [:error_bad_credentials,
   :error_invalid_token,
   :error_no_login].each do |method|
    describe ".#{method}" do
      context 'verbose' do
        let(:v) { true }

        it 'prints error message to STDERR' do
          expect { @object.send(method, v) }.to output(/ERROR/).to_stderr
        end

        it 'prints info message to STDERR' do
          expect { @object.send(method, v) }.to output(/INFO/).to_stderr
        end
      end

      context 'silent' do
        let(:v) { false }

        it 'prints error message to STDERR' do
          expect { @object.send(method, v) }.to output(/ERROR/).to_stderr
        end

        it 'not prints info message to STDERR' do
          expect { @object.send(method, v) }.to_not output(/INFO/).to_stderr
        end
      end
    end
  end

  describe '.error_kosapi_exception' do
    let(:param) do
      { desc: 'desc',
        id: 'id' }
    end

    context 'verbose' do
      let(:v) { true }

      it 'prints error message to STDERR' do
        expect do
          @object.error_kosapi_exception(param, v)
        end.to output(/ERROR/).to_stderr
      end

      it 'prints exception details to STDERR' do
        expect do
          @object.error_kosapi_exception(param, v)
        end.to output(/DESC:/).to_stderr
      end
    end

    context 'silent' do
      let(:v) { false }
      it 'prints error message to STDERR' do
        expect do
          @object.error_kosapi_exception(param, v)
        end.to output(/ERROR/).to_stderr
      end

      it 'not prints exception details to STDERR' do
        expect do
          @object.error_kosapi_exception(param, v)
        end.to_not output(/DESC:/).to_stderr
      end
    end
  end
end
