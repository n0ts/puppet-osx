# Public: Toggle Airport "Remember Recent Networks" Preference
class osx::airport::remember_recent_networks($ensure = 'present') {
  include osx::airport

  if $ensure !~ /^present|absent$/ {
    fail("osx::airport::remember_recent_networks[ensure] must be present or absent, is ${ensure}")
  }

  $enabled = $ensure ? {
    present => 'YES',
    default => 'NO'
  }

  exec { 'Toggle Airport "Remember Recent Networks" Preference':
    command => "${osx::airport::path_to_binary} prefs RememberRecentNetworks=${enabled}",
    unless  => "${osx::airport::path_to_binary} prefs RememberRecentNetworks | grep ${enabled}",
    user    => root,
  }
}
