RSpec.describe KOSapiCLI::CLI do
  subject(:cli) { KOSapiCLI::CLI.new }
  it 'has excluded the base command from commands' do
    expect((cli.class.excluded_commands.include? :BaseCommand)).to be true
  end

  it 'has all commands from Commands module' do
    should = KOSapiCLI::Commands.constants.select do |const|
      command = KOSapiCLI::Commands.const_get(const)
      (command.is_a? Class) && (!cli.class.excluded_commands.include? const)
    end
    expect(should.map { |i| i.to_s.downcase }).to eq cli.class.subcommands
  end
end
