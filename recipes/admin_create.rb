#
# Cookbook Name:: chef-server-12
# Recipe:: admin_create
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
#
# Creates default Admin User

admin_username = node['chef-server']['admin_username']
admin_firstname = node['chef-server']['admin_firstname']
admin_lastname = node['chef-server']['admin_lastname']
admin_email = node['chef-server']['admin_email']
admin_password = node['chef-server']['admin_password']
admin_private_key_path = node['chef-server']['admin_private_key_path']

execute 'create admin' do
  command <<-EOM.gsub(/\s+/, ' ').strip!
    chef-server-ctl user-create #{admin_username}
    #{admin_firstname}
    #{admin_lastname}
    #{admin_email}
    #{admin_password}
    > #{admin_private_key_path}
  EOM
  not_if "chef-server-ctl user-list | grep -w #{admin_username}"
end