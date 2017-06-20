#!/usr/bin/env ruby
require 'rubygems'
require "awesome_print"

locale = ARGV[0].strip
showfor = ARGV[1].strip

base_url = "https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/"

firefox_url = base_url +
 sprintf(
 "category%%3AFirefox-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
firefox_url.gsub!("-en", "") if locale == "en"
# puts firefox_url
puts `../paste-showfor.json.rb #{firefox_url} #{showfor}`

learn_the_basics_url = base_url +
 sprintf(
 "tkb-board%%3ALearn-Basics-Firefox-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
learn_the_basics_url.gsub!("-en", "") if locale == "en"
# puts firefox_url
puts `../paste-showfor.json.rb #{learn_the_basics_url} blank.json`

install_and_update_url = base_url +
 sprintf(
 "tkb-board%%3Ainstall-and-update-kb-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
install_and_update_url.gsub!("-en", "") if locale == "en"
#puts install_and_update_url
puts `../paste-showfor.json.rb #{install_and_update_url} blank.json`

#https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3AProtect-Privacy/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor

protect_privacy_url = base_url +
 sprintf(
 "tkb-board%%3AProtect-Privacy-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
protect_privacy_url.gsub!("-en", "") if locale == "en"
puts `../paste-showfor.json.rb #{protect_privacy_url} blank.json`

# https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3Async-and-save-kb/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor

sync_and_save_url = base_url +
 sprintf(
 "tkb-board%%3Async-and-save-kb-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
sync_and_save_url.gsub!("-en", "") if locale == "en"
puts `../paste-showfor.json.rb #{sync_and_save_url} blank.json`

# https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3APersonalizeFirefox/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor

personalize_firefox_url = base_url +
 sprintf(
 "tkb-board%%3APersonalizeFirefox-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
sync_and_save_url.gsub!("-en", "") if locale == "en"
puts `../paste-showfor.json.rb #{personalize_firefox_url} blank.json`

# https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3AFixproblems/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor

fix_problems_url = base_url +
 sprintf(
 "tkb-board%%3AFixproblems-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
fix_problems_url.gsub!("-en", "") if locale == "en"
puts `../paste-showfor.json.rb #{fix_problems_url} blank.json`

# https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3Aadvancedfirefox/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor

advanced_firefox_url = base_url +
 sprintf(
 "tkb-board%%3Aadvancedfirefox-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
advanced_firefox_url.gsub!("-en", "") if locale == "en"
puts `../paste-showfor.json.rb #{advanced_firefox_url} blank.json`

#https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/forum-board%3AFirefox-Controls/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor

firefox_controls_url = base_url +
 sprintf(
 "tkb-board%%3AFirefox-Controls-%s/preferred-tab/community%%3Aadmin%%3Asystem%%3Asettings-list-editor",
 locale)
firefox_controls_url.gsub!("-en", "") if locale == "en"
puts `../paste-showfor.json.rb #{firefox_controls_url} blank.json`



