require 'spec_helper'

describe 'osx::recovery_message' do
  let(:title)       { 'foo' }
  let(:kextdir)     { '/System/Library/Extensions' }
  let(:eficachedir) { '/System/Library/Caches/com.apple.corestorage/EFILoginLocalizations' }

  it do
    should contain_exec('Refresh system kext cache').with({
      :command     => "/usr/bin/touch #{kextdir}",
      :creates     => eficachedir,
      :refreshonly => true,
      :user        => 'root'
    })

    should contain_exec('Refresh CoreStorage EFI Cache').with({
      :command     => "/usr/bin/touch #{eficachedir}",
      :onlyif      => "test -d #{eficachedir}",
      :refreshonly => true,
      :user        => 'root'
    })
  end

  context 'given a name' do
    let(:title) { 'If this Mac is found, please call 123-123-1234' }

    it do
      should contain_boxen__osx_defaults('Set OS X Recovery Message').with({
        :ensure => 'present',
        :domain => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
        :value  => title,
        :user   => 'root'
      })
    end
  end

  context 'with ensure => absent' do
    let(:title) { 'foo' }
    let(:params) { {:ensure => 'absent'} }

    it do
      should contain_boxen__osx_defaults('Remove OS X Recovery Message').with({
        :ensure => 'absent',
        :domain => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
        :user   => 'root'
      })
    end
  end
end
