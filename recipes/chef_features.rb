#
# Cookbook Name:: chef-server-12
# Recipe:: admin_create
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
#
# Add Chef features to base install

node['chef-server']['feature'].each do |name, enabled|
  install_feature name if enabled
end