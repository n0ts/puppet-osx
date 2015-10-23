# Public: Disables the dashboard
class osx::dashboard::disable {
  include osx::dashboard

  boxen::osx_defaults { 'Toggle Whether Dashboard is Enabled':
    user   => $::boxen_user,
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => true,
    notify => Exec['killall Dashboard'],
  }
}
