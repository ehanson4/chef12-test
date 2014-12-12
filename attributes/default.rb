default['chef-server']['url'] = \
  'https://web-dl.packagecloud.io/chef/stable/packages/el/6/'\
  'chef-server-core-12.0.0-1.el6.x86_64.rpm'

# Default Admin User Attributes
default['chef-server']['admin_username'] = 'chefadmin'
default['chef-server']['admin_firstname'] = 'Chef'
default['chef-server']['admin_lastname'] = 'Admin'
default['chef-server']['admin_email'] = 'chef@chefadmin.com'
default['chef-server']['admin_password'] = 'P@ssw0rd!'
default['chef-server']['admin_private_key_path'] = '/tmp/chefadmin.pem'

# Default Chef Org Attributes
default['chef-server']['organization'] = 'default'
default['chef-server']['organization_long_name'] = 'Default Organization'
default['chef-server']['organization_private_key'] = \
   "#{node['chef-server']['organization']}-validator.pem"
default['chef-server']['organization_private_key_path'] = \
   File.join('/tmp', node['chef-server']['organization_private_key'])

# Chef Premium Features Enabled or Disabled
default['chef-server']['feature']['opscode-manage'] = true
default['chef-server']['feature']['opscode-reporting'] = true
default['chef-server']['feature']['chef-sync'] = false
default['chef-server']['feature']['opscode-push-jobs-server'] = false