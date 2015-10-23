# Public: Download Screen Saver
#
# - URL: Download URL
define osx::screensaver::download(
  $url,
) {
  $path = '/Library/Screen Savers'

  exec { "Download screensaver - ${name}":
    command => join(
      [
        "wget -qO ${name}.zip '${url}'",
        "unzip ${name}.zip -d .",
        "mv /tmp/${name}.saver '${path}'/",
        "rm -fr /tmp/${name}*",
      ], "\n"),
    user    => root,
    cwd     => '/tmp',
    unless  => "test -d '${path}/${name}.saver'",
    require => Package['wget'],
  }
}
