RSpec.describe Minecraft::Data do
  it 'has a version number' do
    expect(Minecraft::Data::VERSION).not_to be nil
  end

  it 'Tests converting a Minecraft uuid to its current username' do
    expect(Minecraft::Data.username_to_uuid('Notch')).to eql('069a79f4-44e9-4726-a5be-fca90e38aaf5')
  end

  it 'Tests converting a Minecraft username to its uuid' do
    expect(Minecraft::Data.uuid_to_username('069a79f4-44e9-4726-a5be-fca90e38aaf5')).to eql('Notch')
  end

  it 'Tests retrieving a Minecraft name history from a username' do
    expect(Minecraft::Data.name_history_of_username('Notch').first.first[1]).to eql('Notch')
  end

  it 'Tests retrieving a Minecraft name history from a uuid' do
    expect(Minecraft::Data.name_history_of_username('069a79f4-44e9-4726-a5be-fca90e38aaf5').first.first[1]).to eql('Notch')
  end

  it 'Tests retrieving a Minecraft skin head url from a username' do
    expect(Minecraft::Data.head_url_of_uuid('BGMP')).to eql('https://api.ashcon.app/mojang/v2/avatar/BGMP')
  end

  it 'Tests retrieving a Minecraft skin head url from a username' do
    expect(Minecraft::Data.head_url_of_uuid('2cef6d05-ec9a-44b3-bedc-53359c68ae65')).to eql('https://api.ashcon.app/mojang/v2/avatar/2cef6d05-ec9a-44b3-bedc-53359c68ae65')
  end
end
