// Extra settings to add on top of Arkenfox

// Disable Firefox updates
user_pref("app.update.auto", false);

// Disable Firefox accounts:
user_pref("identity.fxaccounts.enabled", false);

// Disable pocket, screenshot and picture-in-picture
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.screenshots.disabled", true);
user_pref("media.videocontrols.picture-in-picture.enabled", false);

// Disable crap in the search bar:
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// Disable preloading new tabs:
user_pref("browser.newtab.preload", false);

// Disable access to sensors:
user_pref("device.sensors.enabled", false);

// Disable beacon studies:
user_pref("beacon.enabled", false);

// Do not suggest web history in the URL bar:
user_pref("browser.urlbar.suggest.history", false);

// Disable notifications:
user_pref("dom.push.enabled", false);
user_pref("dom.webnotifications.serviceworker.enabled", false);

// Enable "Do Not Track":
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.donottrackheader.value", 1);

// Disable signin and autofill info
user_pref("signon.rememberSignons", false);
user_pref("browser.formfill.enable", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// Disable feedback reporting
user_pref("browser.chrome.toolbar_tips", false);
user_pref("extensions.abuseReport.enabled", false);

// Force DNS over HTTPS
user_pref("network.trr.mode", 3);
user_pref("network.trr.uri", "https://base.dns.mullvad.net/dns-query");

// Disable WebRTC
user_pref("media.peerconnection.enabled", false);

// Disable bookmarks
user_pref("browser.bookmarks.enabled", false);
user_pref("browser.toolbars.bookmarks.visibility", "never");

// Enforce certificate pinning
user_pref("security.cert_pinning.enforcement_level", 2);

// Disable container tabs
user_pref("privacy.userContext.enabled", false);

// Ask before quitting Firefox
user_pref("browser.warnOnQuit", false);
user_pref("browser.warnOnQuitShortcut", false);
