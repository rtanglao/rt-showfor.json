#!/usr/bin/env ruby
require 'rubygems'
require "awesome_print"

locale = ARGV[0].strip
showfor = ARGV[1].strip
base_url = "https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/"
locale_url = base_url +
 sprintf(
 "category%%3A%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
puts `./paste-showfor.json.rb #{locale_url} #{showfor}`
# puts `echo #{locale_url} #{showfor}`
firefox_url = base_url +
 sprintf(
 "category%%3AFirefox-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
# puts firefox_url
puts `./paste-showfor.json.rb #{firefox_url} #{showfor}`
install_and_update_url = base_url +
 sprintf(
 "tkb-board%%3Ainstall-and-update-kb-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
#puts install_and_update_url
puts `./paste-showfor.json.rb #{install_and_update_url} blank.json`

