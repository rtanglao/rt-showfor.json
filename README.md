# rt-showfor.json
roland's fun showfor.json for lithium repo 
## Other folks' showfor stuff
* see mythmon's tests for showfor: https://gist.github.com/mythmon/7236259

## 18June2017 remove non Thunderbird showfor pickers from Thunderbird
* 1\. Save the current [thunderbird 45 as default showfor for ```Mozilla Support - English```->```Thunderbird```-> ```Install, Migrate and Update```](https://github.com/rtanglao/rt-showfor.json/blob/master/moz-support-english-thunderbird-install-migrate-update-all-products-tb45-as-default-minified-showfor.json) i.e. https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3AInstall-Migrate-Update/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor
* 2\. Replace with [Minified Thunderbird only with tb52 as default](https://github.com/rtanglao/rt-showfor.json/blob/master/thunderbird-only-tb52-as-default-minified-showfor.json) (unminified:[Thunderbird only with tb52 as default](https://github.com/rtanglao/rt-showfor.json/blob/master/thunderbird-only-tb52-as-default-un-minified-showfor.json))
* 3\. See if this fixes https://hwsfp35778.lithium.com/t5/Install-Migrate-and-Update/Moving-Thunderbird-Data-to-a-New-Computer/ta-p/14714 to only have a Thunderbird showfor picker (and no other pickers like Firefox picker)
## 15June2017
### 15June2017-script per locale
Thought of a script per locale: ```paste-Firefox-showfor-for-a-locale.rb```
* 1\. ```./paste-Firefox-showfor-for-a-locale.rb <locale> <showfor.json>```
* 2\. pseudocode:
* a) baseurl = ```https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/category%3A**<locale>**/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor``` ; ./paste-showfor.json.rb baseurl <showfor.json>
* b) firefox_url = baseurl with ```<locale>``` changed to **Firefox-\<locale>** ; ./paste-showfor.json.rb firefox_url <showfor.json>
* c) install_and_update_url = ```https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3Ainstall-and-update-kb-**<locale>**/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor``` ./paste-showfor.json.rb install_and_update_url blank.json
### 15June2017-running script per locale
* 1\. successful run with German
```bash
./paste-Firefox-showfor-for-a-locale.rb de showfor.json
```
* 2\. Firefox and install and update won't work with dsb, et,etc because e.g. with dsb there's no Firefox-dsb or tkb for dsb
<br /> Sample error with dsb:
```bash
./paste-Firefox-showfor-for-a-locale.rb dsb showfor.json
```
```
Net::HTTPNotFound for 
https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/\
category%3AFirefox-dsb/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor 
-- unhandled response (Mechanize::ResponseCodeError)

Net::HTTPNotFound for 
https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/\
tkb-board%3Ainstall-and-update-kb-dsb/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor 
-- unhandled response (Mechanize::ResponseCodeError)
```
### 15June2017-run it on the last 22 locales
```bash
cat last22locales.txt | parallel -N 1 ./paste-Firefox-showfor-for-a-locale.rb {} showfor.json
```
## 14June2017
how to blank out Firefox, here's an example for Japanese:
```bash
./paste-showfor.json \
https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/category%3AFirefox-ja/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor \
blank.json
```
error:
```
Net::HTTPNotFound for https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/category%3AFirefox-dsb/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor -- unhandled response (Mechanize::ResponseCodeError)
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/mechanize-2.7.5/lib/mechanize.rb:464:in `get'
	from ./paste-showfor.json.rb:29:in `<main>'
Net::HTTPNotFound for https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin/node-display-id/tkb-board%3Ainstall-and-update-kb-dsb/preferred-tab/community%3Aadmin%3Asystem%3Asettings-list-editor -- unhandled response (Mechanize::ResponseCodeError)
```
* 1\. added Finnish, Hungarian
* 2\. Italian (had to manually blank out the showfor.json for italian->Firefox)
* 3\. Japanese had to manually blank out showfor.json
* 4\. Done up until Bosnia, 22 to go (to make it work, you add showfor.json to the top level locale and if need be, blank out locale->Firefox and locale->Firefox->whatever the sub category is)

## 13June2017
### Multiple files at a time

* 1\. today I did english, spanish, french and german
```bash
cat showfor-without-french-and-german.txt | \
parallel -N 1 ./paste-showfor.json.rb {} showfor.json
```
* 2\. time to ask the community to test in english spanish, french and german!
* 3\. tomorrow do the rest!

### One file at a time
* 1\. inheritance seems to work :-) (but you have to do it product by product at least for spanish you have to do  ES AND Firefox->ES ) Try with French: i.e. ```Mozilla Support Community``` -> ```Assistance de Mozila Français``` aka https://hwsfp35778.lithium.com/t5/bizapps/page/node-display-id/category%3Afr/tab/community%3Aadmin%3Asystem%3Asettings-list-editor
* 2\. how to test with French
```bash
./paste-showfor.json.rb \
https://hwsfp35778.lithium.com/t5/bizapps/page/node-display-id/category%3Afr/tab/community%3Aadmin%3Asystem%3Asettings-list-editor \
showfor.json
```
* 3\. and it works! yay see https://hwsfp35778.lithium.com/t5/Installation-et-mise-à-jour/Important-fin-de-la-prise-en-charge-de-Firefox-pour-Windows-XP/ta-p/31596

## 12June2017
* 1\. sample [paste-showfor.json.rb](https://github.com/rtanglao/rt-showfor.json/blob/master/paste-showfor.json.rb) run to update top level german i.e. ```Mozilla Support Community``` -> ```Mozilla Hilfe - Deutsch``` (stderr is the value BEFORE paste, stdout is the value being pasted e.g. in this example [https://github.com/rtanglao/rt-showfor.json/blob/master/showfor.json](showfor.json)), ```ARGV0``` is the URL of the Lithium showfor category e.g. [german top level is https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin%3Asystem%3Asettings-list-editor/node-display-id/category%3Ade](https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin%3Asystem%3Asettings-list-editor/node-display-id/category%3Ade) ```ARGV1``` is the minified showfor.json file:
```bash
./paste-showfor.json.rb \
https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin%3Asystem%3Asettings-list-editor/node-display-id/category%3Ade\
showfor.json
```
* 2\. read what we just changed i.e. ```Mozilla Support Community``` -> ```Mozilla Hilfe - Deutsch```
```bash
./print-showfor.json.rb \ 
https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin%3Asystem%3Asettings-list-editor/node-display-id/category%3Ade \
>german.json
```
* 3\. it should be what we passed in and it is!
```bash
diff -w german.json showfor.json
```
## 07June2017
* 1\. test if the [fixed showfor with FF54 default](https://github.com/rtanglao/rt-showfor.json/blob/master/showfor.json) fixes https://bugzilla.mozilla.org/show_bug.cgi?id=1336834 on https://hwsfp35778.lithium.com/t5/Personalize-Firefox/Control-whether-Firefox-automatically-fills-in-forms/tac-p/1389972 by copy and passing into https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin%3Asystem%3Asettings-list-editor/node-display-id/tkb-board%3APersonalizeFirefox i.e. ```Mozilla Support English``` -> ```Firefox``` -> ```Personalize Firefox```
* 2\. it works!
* 3\. copy and paste into all English KB categories
## 06June2017
* 1\. create [Firefox 54 as default un-minified showfor.json](https://github.com/rtanglao/rt-showfor.json/blob/master/54-as-default-un-minified-showfor.json) from 53 default version of [un-minified showfor.json](https://github.com/rtanglao/rt-showfor.json/blob/master/un-minified-showfor.json)
* 2\. ```cp 54-as-default-un-minified-showfor.json  un-minified-showfor.json``` so we have a history and something we can diff
* 3\. minify #2 results in [54-as-default-minified-showfor.json](https://github.com/rtanglao/rt-showfor.json/blob/master/54-as-default-minified-showfor.json) 
* 4\. ```cp 54-as-default-minified-showfor.json  showfor.json``` so we have a history and something we can diff (not sure if it will work with minified file)

## 30May2017
* 1\. test if the [fixed showfor with FF53 default without iOS from 3 weeks ago](https://raw.githubusercontent.com/rtanglao/rt-showfor.json/master/fx53-is-default-minified.json) fixes https://bugzilla.mozilla.org/show_bug.cgi?id=1328563 on https://hwsfp35778.lithium.com/t5/Protect-your-privacy/Private-Browsing-Use-Firefox-without-saving-history/ta-p/4473 fixes https://bugzilla.mozilla.org/show_bug.cgi?id=1328563 by copying and pasting into https://hwsfp35778.lithium.com/t5/bizapps/page/node-display-id/tkb-board%3AProtect-Privacy/tab/community%3Aadmin%3Asystem%3Asettings-list-editor i.e. ```Mozilla Support English``` -> ```Firefox``` -> ```Protect your privacy```
* 2\. And it fails! Still shows both Linux and Mac if you select Linux while on Mac.

## 29May2017 
* 1\. test if the [fixed showfor with FF53 default without iOS from 3 weeks ago](https://raw.githubusercontent.com/rtanglao/rt-showfor.json/master/fx53-is-default-minified.json) fixes https://bugzilla.mozilla.org/show_bug.cgi?id=1336834 on https://hwsfp35778.lithium.com/t5/Personalize-Firefox/Control-whether-Firefox-automatically-fills-in-forms/tac-p/1389972 by copy and passing into https://hwsfp35778.lithium.com/t5/bizapps/bizappspage/tab/community%3Aadmin%3Asystem%3Asettings-list-editor/node-display-id/tkb-board%3APersonalizeFirefox i.e. ```Mozilla Support English``` -> ```Firefox``` -> ```Personalize Firefox```
* 2\. **And if WORKS yay! me! :-)**

## 26May2017
* 1\. test showfor inheritance: paste working showfor.json with 53 as default into ```Mozilla Support English``` -> ```Contributor Resources``` -> ```Templates``` and delete showfor.json i.e. make it blank in ```Mozilla Support English``` -> ```Contributor Resources``` -> ```Templates``` -> ```Firefox``` and see if it works i.e. https://hwsfp35778.lithium.com/t5/Firefox/Template-PluginSupportEOL/ta-p/28718 still shows 53 as default
* 2\. I didn't do the test in 1. exactly! instead i just deleted the showfor.json from ```Mozilla Support English``` -> ```Contributor Resources``` -> ```Templates``` -> ```Firefox```. That's it that's all :-) ! And it appeared to inherit the showfor.json from ```Mozilla Support English``` -> ```Contributor Resources``` -> ```Templates```  or even higher up in the inheritance tree of the community structure.

## 24May2017 
* 1\. paste yesterday's ```showfor.json``` i.e. https://github.com/rtanglao/rt-showfor.json/blob/master/23may-2017-minified-ff53default-Mozilla_Support_English-Contributor_Resources-Templates-Firefox.json into ```Contributor Resources``` -> ```Templates``` -> ```Firefox``` into ```Mozilla Support English``` -> ```Firefox``` -> ```Fix Problems``` and see it if fixes i.e. ff53 as default in https://hwsfp35778.lithium.com/t5/Videos-sound-pictures-and/Why-do-I-have-to-click-to-activate-plugins/ta-p/5122
* 2\. it does! SUCCESS!
* 3\. paste yeserday's JSON into ```Personalize Firefox``` -> ```Manage preferences and add-ons``` and see if it shows 53 as default https://hwsfp35778.lithium.com/t5/Manage-preferences-and-add-ons/How-to-turn-off-Java-applets/ta-p/970 
* 4\. it does! SUCCESS!

## 23May2017
* 1\. changed default to 53 from 51, resulting unminified file: https://github.com/rtanglao/rt-showfor.json/blob/master/23may2017-unminified-ff53default-Mozilla_Support_English-Contributor_Resources-Templates-Firefox.json
* 2\. minified it with http://www.cleancss.com/json-minify/, resulting minified file: https://github.com/rtanglao/rt-showfor.json/blob/master/23may-2017-minified-ff53default-Mozilla_Support_English-Contributor_Resources-Templates-Firefox.json
* 3\. paste into ```Mozilla Support English``` -> ```Contributor Resources``` -> ```Templates``` -> ```Firefox``` and see if the default changes from 51 to 53 in https://hwsfp35778.lithium.com/t5/Firefox/Template-PluginSupportEOL/ta-p/28718
* 4\. RESULT: **It works! but only in Firefox 53 release, ~~doesn't work in nightly 55 (nightly 55 defaults to fx51)~~** Next up try adding fx54 and fx55 and fx56 to see if that fixes nightly! - Actually it does work in nightly 55 after restarting nightly 55!
## 22May2017
* 1\. article [https://hwsfp35778.lithium.com/t5/Videos-sound-pictures-and/Troubleshoot-issues-with-plugins-like-Flash-or-Java-to-fix/ta-p/1157](https://hwsfp35778.lithium.com/t5/Videos-sound-pictures-and/Troubleshoot-issues-with-plugins-like-Flash-or-Java-to-fix/ta-p/1157) with showfor.json at: https://hwsfp35778.lithium.com/t5/bizapps/page/node-display-id/category%3AFix-Slowness/tab/community%3Aadmin%3Asystem%3Asettings-list-editor ```Mozilla Support English``` -> ```Firefox``` -> ```Fix Problems```
which **doesn't** work according to Alice in [comment 15 of bug 1341813\(https://bugzilla.mozilla.org/show_bug.cgi?id=1341813#c15) has the following unminfied showfor.json: [https://github.com/rtanglao/rt-showfor.json/blob/master/unminified-Mozilla%20Support%20English%20-%3E%20Firefox%20-%3E%20Fix%20Problems.json](https://github.com/rtanglao/rt-showfor.json/blob/master/unminified-Mozilla%20Support%20English%20-%3E%20Firefox%20-%3E%20Fix%20Problems.json)
* 2\. template article [https://hwsfp35778.lithium.com/t5/Firefox/Template-PluginSupportEOL/ta-p/28718](https://hwsfp35778.lithium.com/t5/Firefox/Template-PluginSupportEOL/ta-p/28718) with showfor.json at: https://hwsfp35778.lithium.com/t5/bizapps/page/node-display-id/tkb-board%3AFirefoxtemplates/tab/community%3Aadmin%3Asystem%3Asettings-list-editor ```Mozilla Support English``` -> ```Contributor Resources``` -> ```Templates``` -> ```Firefox``` has the following unminified showfor.json: https://github.com/rtanglao/rt-showfor.json/blob/master/unminified-Mozilla%20Support%20English%20-%3E%20Contributor%20Resources%20-%3E%20Templates%20-%3E%20Firefox.json
* 3\. **THEORY**: we broke something in: https://github.com/rtanglao/rt-showfor.json/blob/master/unminified-Mozilla%20Support%20English%20-%3E%20Firefox%20-%3E%20Fix%20Problems.json
* 4\. **SOLUTION** : start with: https://github.com/rtanglao/rt-showfor.json/blob/master/unminified-Mozilla%20Support%20English%20-%3E%20Contributor%20Resources%20-%3E%20Templates%20-%3E%20Firefox.json and use it as the master for  https://github.com/rtanglao/rt-showfor.json/blob/master/unminified-Mozilla%20Support%20English%20-%3E%20Firefox%20-%3E%20Fix%20Problems.json

## 17May2017
* 1\. Added https://github.com/rtanglao/rt-showfor.json/blob/master/custom.show-for.xml which comes from: \
https://support-stage.allizom.org/t5/bizapps/page/tab/community%3Astudio%3Acustom-content?component=custom.show-for
* 2\. The following lines look suspicious, perhaps it's not loading the correct version of showfor.json for certain URLs and loading it for other URLs like https://hwsfp35778.lithium.com/t5/Documents-Archive/quot-This-Connection-is-Untrusted-quot-error-message-appears/ta-p/589  ?!?
```ftl
<#assign versionConfigJSON = coreNode.settings.name.get("show_for.version_config") />
<#if versionConfigJSON?has_content>
```

## 16May2017
* As pointed out by the fab Alice, Showfor set default **IS** working for certain articles like: https://hwsfp35778.lithium.com/t5/Documents-Archive/quot-This-Connection-is-Untrusted-quot-error-message-appears/ta-p/589 see https://bugzilla.mozilla.org/show_bug.cgi?id=1341813#c13
## 10May2017
* 1\. made fx53 the default (default was formerly fx50) and uploaded it as per March 2, 2017 procedure but it's still showing fx50 as the default. and I updated the bug: https://bugzilla.mozilla.org/show_bug.cgi?id=1341813#c7

## March 2, 2017

1. [bug 1339484](https://bugzilla.mozilla.org/show_bug.cgi?id=1339484)-fix free marker template problems with showfor.json (corrupted because of minify errors? copy and paste errors? [here is the corrupted Android showfor.json](https://gist.github.com/rtanglao/56ea41d22cc7a868038f5310c53f7c11) in case we ever need it :-)). After running through an [un-minifier](http://unminify.com/):
    2. global search and replace "!0" with "true"
    3. global search and replace "!1" with "false"
    4. make firefox 51 the default for desktop i.e. fx51
    5. make firefox 51 the default for android i.e. m51
6. Result: [unminified-showfor.json](https://github.com/rtanglao/rt-showfor.json/blob/master/unminifyd-showfor.json)
7. Run unminified-showfor.json through a [minifier](http://www.cleancss.com/json-minify/) and result is [showfor.json](https://github.com/rtanglao/rt-showfor.json/blob/master/showfor.json) suitable for copying and pasting into lithium (copy and paste the RAW github file! Copy and Paste into Lithium Admin::Settings List Editor on left sidebar :: SYSTEM Tab :: click on "Choose" to the right of "Knowledge Base Settings for:" and then select: 
    8. Mozilla Support Community :: Mozilla Support - English ::Contributor Resources :: Templates
    9. Mozilla Support Community :: Mozilla Support - English :: Archive
    10. Mozilla Support Community :: Mozilla Support - English :: Common Responses
    11. Mozilla Support Community :: Mozilla Support - English
