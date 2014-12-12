#
# Cookbook Name:: chef-server-12
# Recipe:: admin_create
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
#
# Creates default Chef Org

organization = node['chef-server']['organization']
organization_long_name = node['chef-server']['organization_long_name']
admin_username = node['chef-server']['admin_username']
organization_private_key_path = \
  node['chef-server']['organization_private_key_path']

execute 'create organization' do
  command <<-EOM.gsub(/\s+/, ' ').strip!
    chef-server-ctl org-create #{organization}
    #{organization_long_name}
    -a #{admin_username}
    > #{organization_private_key_path}
  EOM
  not_if "chef-server-ctl org-list | grep -w #{organization}"
end