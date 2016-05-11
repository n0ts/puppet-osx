# Public: Show Time Zone
class osx::calendar::show_time_zone {
  boxen::osx_defaults { 'Show Time Zome':
    user   => $::boxen_user,
    domain => 'com.apple.iCal',
    key    => 'TimeZone support enabled',
    value  => true,
  }
}
