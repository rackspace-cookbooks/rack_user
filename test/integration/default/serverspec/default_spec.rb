# Encoding: utf-8

require_relative 'spec_helper'

describe user('rack') do
  context 'when the rack user has been added' do
    it { is_expected.to exist }
  end

  context 'when the rack user\'s authorized keys have been added' do
    # rubocop:disable LineLength
    it { is_expected.to have_authorized_key('ssh-rsa ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGH foo1@bar1.local') }
    it { is_expected.to have_authorized_key('ssh-rsa BBCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGH foo2@bar2.local') }
    it { is_expected.to have_authorized_key('ssh-rsa CBCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGH foo3@bar4.local') }
    # rubocop:enable LineLength
  end
end

describe file('/etc/sudoers.d/rack') do
  context 'when the rack user has a sudo permissions file' do
    it { is_expected.to be_file }
    it { is_expected.to contain('rack ALL=(ALL) NOPASSWD:ALL') }
  end
end

describe command('sudo -u rack sudo -l') do
  context 'when the rack user has functional sudo permissions' do
    its(:stdout) { is_expected.to contain('\(ALL\) NOPASSWD: ALL') }
  end
end

describe file('/etc/shadow') do
  context 'when the rack user is unlocked' do
    it { is_expected.to be_file }
    it { is_expected.to contain('rack:*:') }
  end
end
