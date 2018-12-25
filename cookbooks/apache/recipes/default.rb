#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
package "httpd" do
	action :install
end

#service "httpd" do
#	action [ :enable, :start ]
#end

#cookbook_file "/var/www/html/index.html" do
#	source "index.html"
#	mode "0644"
#end

template "/var/www/html/index.html" do
	source "index.html.erb"
	mode "0644"
	variables(
		message: "#{node["message"]} #{node[:ipaddress]}"
        )
end

service "httpd" do
        action [ :enable, :restart ]
end


