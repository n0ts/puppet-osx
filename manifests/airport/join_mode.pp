# Public: Set What to Do When Preferred Networks Are Available
class osx::airport::join_mode($mode = 'Automatic') {
  include osx::airport

  if $mode !~ /^(Automatic|Preferred|Ranked|Recent|Strongest)$/ {
    fail("osx::airport::join_mode[mode] must be one of the following: Automatic, Preferred, Ranked, Recent, Strongest; is ${mode}")
  }

  exec { 'Set What to Do When Preferred Networks Are Available':
    command => "${osx::airport::path_to_binary} prefs JoinMode=${mode}",
    unless  => "${osx::airport::path_to_binary} prefs JoinMode | grep ${mode}",
    user    => root,
  }
}
