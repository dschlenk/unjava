name 'unjava'
maintainer 'Spanlink Communications, Inc.'
maintainer_email 'dschlenk@converge-one.com'
license 'apache2'
description 'Installs/Configures unjava'
long_description 'Installs/Configures unjava'
version '0.1.1'
depends 'java'

recipe "unjava::default", "Includes unjava::unjava."
recipe "unjava::unjava", "Prevents installation of OpenJDK due to the inclusion of the default community cookbook in another recipe in the run list."
recipe "unjava::rejava", "Reverses the prevention of OpenJDK installation from the unjava recipe and includes the default recipe from the community java cookbook."

%w{
    debian
    ubuntu
    centos
    redhat
    scientific
    fedora
    amazon
    oracle
    freebsd
}.each do |os|
  supports os
end
