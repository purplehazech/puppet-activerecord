# == Class: activerecord
#
# describe what the modules main class does
#
# === Parameters
# [*enable*]
#   present or absent, activate activerecord with this switch
#
# === Example Usage
#
#   include activerecord
#
# This is a call to activerecord with complete args
#
#   class { 'activerecord':
#     ensure => present,
#   }
#
class activerecord (
  $enable = hiera('enable', present)
) {
  validate_re($enable, [ '^present', '^absent' ])

  $package_name =  $::osfamily ? {
    'Debian' => 'libactiverecord-ruby',
    default  => 'activerecord'
  }

  if ($enable == absent) {
    notify{ "activerecord is ${enable}": }
  }
  package { $package_name:
    ensure => $enable
  }
}
