# Public: Set Screen Saver Module
#
# - moduleName: Screen Saver module name
# - ext: Screen Saver extension saver or qtz
# - path: Screen Saver path
# - type: .qtz is 1, random is 8, other is 0
define osx::screensaver::module(
  $moduleName = $name,
  $ext        = 'saver',
  $path       = undef,
  $type       = undef,
){
  $path_ = $path ? {
    'system'  => '/System/Library/Screen Savers',
    'library' =>  '/Library/Screen Savers',
    undef     => $moduleName,
    default   => $path,
  }

  $type_ = $type ? {
    undef   => 0,
    default => $type,
  }

  $xml = plist_read_xml('currentHost', 'com.apple.screensaver', 'moduleDict', true)
  $key_value = {
    'moduleName' => $moduleName,
    'path' => "${path_}/${moduleName}.${ext}",
    'type' => $type_,
  }
  $keys_xml = plist_set_xml_key_value($xml, '', 'moduleDict', $key_value, true)
  boxen::osx_defaults { "Set screensaver module for ${name}":
    host      => 'currentHost',
    user      => $::boxen_user,
    domain    => 'com.apple.screensaver',
    key       => 'moduleDict',
    value     => $keys_xml,
    readvalue => $xml,
  }
}
