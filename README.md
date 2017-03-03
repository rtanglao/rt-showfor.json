# rt-showfor.json
roland's fun showfor.json for lithium repo

## March 2, 2017

1. fix problems with showfor.json (corrupted because of minify errors? copy and paste errors? [here is the corrupted Android showfor.json](https://gist.github.com/rtanglao/56ea41d22cc7a868038f5310c53f7c11) in case we ever need it :-))
    2. global search and replace "!0" with "true"
    3. global search and replace "!1" with "false"
    4. make firefox 51 the default for desktop i.e. fx51
    5. make firefox 51 the default for android i.e. m51
6. Result: [unminified-showfor.json](https://github.com/rtanglao/rt-showfor.json/blob/master/unminifyd-showfor.json)
7. Run unminified-showfor.json through a [minifier](http://www.cleancss.com/json-minify/) and result is [showfor.json](https://github.com/rtanglao/rt-showfor.json/blob/master/showfor.json) suitable for copying and pasting into lithium (copy and paste the RAW github file!) (e.g. for Firefox for Android Copy and Paste into Lithium Admin::Settings List Editor on left sidebar :: SYSTEM Tab :: click on "Choose" to the right of "Knowledge Base Settings for:" and then select: [Mozilla Support Community :: Mozilla Support - English ::Contributor Resources :: Templates :: Firefox for Android](https://support.mozilla.org/t5/bizapps/page/node-display-id/tkb-board%3Affandroid_template/tab/community%3Aadmin%3Asystem%3Asettings-list-editor)