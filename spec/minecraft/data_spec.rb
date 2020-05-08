RSpec.describe Minecraft::Data do
  it 'has a version number' do
    expect(Minecraft::Data::VERSION).not_to be nil
  end

  it 'Tests converting a Minecraft uuid to its current username' do
    expect(Minecraft::Data.username_to_uuid('069a79f4-44e9-4726-a5be-fca90e38aaf5')) == 'Notch'
  end

  it 'Tests converting a Minecraft username to its uuid' do
    expect(Minecraft::Data.uuid_to_username('Notch')) == '069a79f4-44e9-4726-a5be-fca90e38aaf5'
  end

  it 'Tests retrieving a Minecraft name history from a username' do
    expect(Minecraft::Data.name_history_of_username('Notch').first.eql?('Notch'))
  end

  it 'Tests retrieving a Minecraft name history from a uuid' do
    expect(Minecraft::Data.name_history_of_username('069a79f4-44e9-4726-a5be-fca90e38aaf5').first.eql?('Notch'))
  end

  it 'Tests retrieving a Minecraft skin head url' do
    expect(Minecraft::Data.head_url_of('069a79f4-44e9-4726-a5be-fca90e38aaf5', true).eql?('https://crafatar.com/avatars/069a79f4-44e9-4726-a5be-fca90e38aaf5'))
  end
end
