#!/usr/bin/env ruby
require 'rubygems'
require 'mechanize'
require 'parseconfig'
require 'pp'
require 'openssl'
require "awesome_print"

prev_setting = OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

prod_config = ParseConfig.new('user.conf').params
userid = prod_config['userid']
password = prod_config['password']

mechanize = Mechanize.new
login_page = mechanize.get 'https://hwsfp35778.lithium.com/t5/user/userloginpage'

form = login_page.forms[1]
form.field_with(id: 'lia-login').value = userid
form.field_with(id: 'lia-password').value = password

page = form.submit

#$stderr.printf("HTTP GET: %s\n", ARGV[0])

showfor_page = mechanize.get ARGV[0]
form = showfor_page.forms[1]
# $stderr.printf("BEFORE\n)
# ap form.show_forversion_config
$stderr.print form.show_forversion_config
showfor_minified = File.read(ARGV[1])
print showfor_minified

#form.show_forversion_config = 

#pp tkb_page
# puts("POSSIBLE-locale,link")
# tkb_page.css('div.tkb-other-language-link').each do |l|
#   possible_locale = l.css('a:nth-child(1)').children.text
#   possible_locale = "NOT en-us" if possible_locale == "English (US)"
#   printf("%s,%s\n", possible_locale,
#          "https://support.mozilla.org" +
#          l.css('a:nth-child(1)/@href').first.value)
# end
