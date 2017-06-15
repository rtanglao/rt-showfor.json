#!/usr/bin/env ruby
require 'rubygems'
require 'mechanize'
require 'parseconfig'
require 'pp'
require 'openssl'
require "awesome_print"

exit if ARGV[0][0] == "#" # if first character is a "#" then exit
# https://stackoverflow.com/questions/1113422/how-to-bypass-ssl-certificate-verification-in-open-uri
# https://gist.github.com/siruguri/66926b42a0c70ef7119e kludge:
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

showfor_page = mechanize.get ARGV[0]
form = showfor_page.forms[1]
$stderr.print form.show_forversion_config #old value on stderr
showfor_minified = File.read(ARGV[1])
print showfor_minified #new value on stdout

form.field_with(id: 'show_forversion_config').value = showfor_minified
form.submit

