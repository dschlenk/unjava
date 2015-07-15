# undo what might have been done in the default recipe
case node['platform_family']
when 'debian', 'rhel', 'fedora', 'freebsd'
  node.set[:java][:install_flavor] = 'openjdk'
  # for some reason unwinding packages doesn't work so instead we change action
  node[:java][:openjdk_packages].each do |p|
    begin
      resources("package[#{p}]").action node[:unjava][:undo_action]
    rescue
      Chef::Log.warn "Unable to change action on package #{p}."
    end
  end
  include_recipe('java::default')
else
  Chef::Log.debug "Preventing Java installation in #{node[:platform_family]} not supported, no undoing required."
end
