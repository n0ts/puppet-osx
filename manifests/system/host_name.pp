# Public: Set HostName
class osx::system::host_name($host_name = 'localHost') {
  exec { "hostname ${host_name}":
    unless => "hostname | grep ${host_name}",
    user   => root,
  }

  exec { "scutil --set ComputerName ${host_name}":
    unless => "scutil --get ComputerName | grep ${host_name}",
    user   => root,
  }

  exec { "scutil --set HostName ${host_name}":
    unless => "scutil --get HostName | grep ${host_name}",
    user   => root,
  }

  exec { "scutil --set LocalHostName ${host_name}":
    unless => "scutil --get LocalHostName | grep ${host_name}",
    user   => root,
  }

  boxen::osx_defaults { 'Update Computer NetBIOS Host Name - Part 1':
    user   => root,
    domain => '/Library/Preferences/SystemConfiguration/com.apple.smb.server',
    key    => 'NetBIOSName',
    value  => $host_name,
  }

  boxen::osx_defaults { 'Update Computer NetBIOS Host Name - Part 2':
    user   => root,
    domain => '/Library/Preferences/SystemConfiguration/com.apple.smb.server',
    key    => 'ServerDecription',
    value  => $host_name,
  }
}
