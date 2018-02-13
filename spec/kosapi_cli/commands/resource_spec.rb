RSpec.describe KOSapiCLI::Commands::Resource do
  subject(:resource) { KOSapiCLI::Commands::Resource.new }

  it_behaves_like 'BaseCommand descendat', KOSapiCLI::Commands::Resource

  it 'has excluded the BaseResource from subcommands' do
    expect((resource.class.excluded_resources.include? :BaseResource)).to\
      be true
  end

  it 'loads all resources from Resource module' do
    should = KOSapiCLI::Commands::Resources.constants.select do |const|
      resource = KOSapiCLI::Commands::Resources.const_get(const)
      (resource.is_a? Class) &&
        (!KOSapiCLI::Commands::Resource.excluded_resources.include? const)
    end
    expect(should.map { |i| i.to_s.downcase }).to eq resource.class.subcommands
  end
end
