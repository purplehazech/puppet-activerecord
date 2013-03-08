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

  if ($enable == absent) {
    notify{ "activerecord is ${enable}": }
  }
  package { 'activerecord':
    require => $enable
  }
}
