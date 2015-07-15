default[:unjava][:package_action] = :nothing
default[:unjava][:resources] = [
  'java_alternatives[set-java-alternatives]',
  'ruby_block[set-env-java-home]',
  'directory[/etc/profile.d]',
  'file[/etc/profile.d/jdk.sh]'
]
case node['platform_family']
#when 'rhel', 'fedora'
#  default[:unjava][:packages] = [
#    'package[java-1.6.0-openjdk]',
#    'package[java-1.6.0-openjdk-devel]'
#  ]
when 'debian'
  default[:unjava][:resources] << 'link[/usr/lib/jvm/default-java]'
#  default[:unjava][:packages] = [
#    'package[openjdk-6-jdk]',
#    'package[openjdk-6-jre-headless]'
#  ]
end
