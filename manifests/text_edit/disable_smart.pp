# Public: Disable Smart
class osx::text_edit::disable_smart {
  boxen::osx_defaults { 'Disable SmartCopyPaste':
    user   => $::boxen_user,
    domain => 'com.apple.TextEdit',
    key    => 'SmartCopyPaste',
    type   => 'bool',
    value  => false,
  }

  boxen::osx_defaults { 'Disable SmartDashes':
    user   => $::boxen_user,
    domain => 'com.apple.TextEdit',
    key    => 'SmartDashes',
    type   => 'bool',
    value  => false,
  }

  boxen::osx_defaults { 'Disable SmartQuotes':
    user   => $::boxen_user,
    domain => 'com.apple.TextEdit',
    key    => 'SmartQuotes',
    type   => 'bool',
    value  => false,
  }
}
