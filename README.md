# rt-showfor.json
roland's fun showfor.json for lithium repo

## 17May2017
* Add https://github.com/rtanglao/rt-showfor.json/blob/master/custom.show-for.xml which comes from: \
https://support-stage.allizom.org/t5/bizapps/page/tab/community%3Astudio%3Acustom-content?component=custom.show-for

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
