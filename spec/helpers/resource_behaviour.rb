shared_examples_for 'resource' do |resource|
  describe '.subresources' do
    it 'has method defining subresources' do
      expect(resource).to respond_to(:subresources)
    end

    it 'returns array of subresources' do
      expect(resource.subresources).to be_an Array
    end
  end

  resource.subresources.each do |subresource|
    it 'defines desc usage and long_desc methods for all subresources' do 
      %i[desc usage long_desc].each do |method|
        expect(resource).to respond_to("#{subresource}_#{method}")
      end
    end
  end

  describe '.define_subresources' do
    it 'has method define_subresources' do
      expect(resource).to respond_to(:define_subresources)
    end
  end

  describe '.subcommand_name' do
    it 'has subcommand_name method' do
      expect(resource).to respond_to(:subcommand_name)
    end

    it 'corespond with class name' do
      expect(resource.subcommand_name).to eq\
        resource.name.split('::').last.underscore
    end
  end

  describe '.usage' do
    it 'has usage method' do
      expect(resource).to respond_to(:usage)
    end

    it 'shows all subresources' do

    end
  end

  describe '.desription' do
    it 'has description method' do
      expect(resource).to respond_to(:description)
    end

    it 'change the default description' do
      expect(resource.description).to_not match(/CHANGE IT/)
    end
  end

  resource.subresources.each do |subresource|
    describe "##{subresource}" do
      it "has #{subresource} method" do
        expect(resource.new).to respond_to(subresource)
      end
    end
  end
end
