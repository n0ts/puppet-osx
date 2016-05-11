# Public: Show Week Numbers
class osx::calendar::show_week_numbers {
  boxen::osx_defaults { 'Show Week Numbers':
    user   => $::boxen_user,
    domain => 'com.apple.iCal',
    key    => 'Show Week Numbers',
    value  => true,
  }
}
