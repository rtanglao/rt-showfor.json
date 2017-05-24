# rt-showfor.json
roland's fun showfor.json for lithium repo

## Other folks' showfor stuff
* see mythmon's tests for showfor: https://gist.github.com/mythmon/7236259

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
