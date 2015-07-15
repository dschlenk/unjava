default[:unjava][:package_action] = :nothing
default[:unjava][:resources] = [
  'java_alternatives[set-java-alternatives]',
  'ruby_block[set-env-java-home]',
  'directory[/etc/profile.d]',
  'file[/etc/profile.d/jdk.sh]'
]
case node['platform_family']
when 'debian'
  default[:unjava][:resources] << 'link[/usr/lib/jvm/default-java]'
when 'freebsd'
  default[:unjava][:resources] = []
end
