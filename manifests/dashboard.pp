# Public: Dashboard
class osx::dashboard($ensure = 'present') {
  exec { 'killall Dashboard':
    refreshonly => true
  }
}
