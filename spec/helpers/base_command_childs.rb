shared_examples_for 'BaseCommand descendat' do |descendant|

  describe '.command_name' do
    it 'has command_name method' do
      expect(descendant).to respond_to(:command_name)
    end

    it 'return name of command' do
      result = descendant.command_name
      expect(result).to be_a String
      expect(result.empty?).to be false
    end
  end

  describe '.subcommand_names' do
    it 'has subcommand_names method' do
      expect(descendant).to respond_to(:subcommand_names)
    end

    it 'return an array of subcommands' do
      result = descendant.subcommand_names
      expect(result).to be_an Array
      expect(result.empty?).to be false
    end
  end

  describe '.usage' do
    it 'has usage method' do
      expect(descendant).to respond_to(:usage)
    end

    it 'return usage of command' do
      result = descendant.usage
      expect(result).to be_a String
      expect(result.empty?).to be false
    end
  end

  describe '.description' do
    it 'has description method' do
      expect(descendant).to respond_to(:description)
    end

    it 'changes the default description' do
      expect(descendant.description).to_not match(/CHANGE IT/)
    end
  end
end
