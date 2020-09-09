# Tapdaq iOS SDK Changelog

# 1.1.0 (2016-04-26)

- Introduced Placement Tags.
- Removed handling of IDFA blacklists.
- Bug fixes related to frequency cap on promotion level.

# 1.0.1 (2016-03-10)

- Removed TapdaqResources.bundle dependency, settings persist to NSUserDefaults.

# 1.0.0 (2015-12-08)

- New Tapdaq interface. More intuitive integration for developers.
- Improved logging to detect issues during integration.
- Fix for orientation handling.
- Detects "first bootup", stronger guarantees of install counting.
- Support for frequency cap & duration on each promotion.

# 0.9.5-rc2 (2015-08-29)

- Fixed build error where supported platform was iPhoneOS.

# 0.9.5 (2015-08-28)

- Set CLANG_ENABLE_MODULES to NO, removes compiler warnings.

# 0.9.4 (2015-08-15)

- Support for iOS9.

# 0.9.3-rc5 (2015-07-08)

- Added ability for wrappers to include a SDK identifier prefix in the config.

# 0.9.3 (2015-06-23)

- Introducing ad mediation mode. This allows developers to integrate Tapdaq into Admob and other mediation tools.
- Full control over when an advert is loaded.
- Delegate methods for when an advert fails or is successfully loaded.
- Improved queue management of adverts.

# 0.9.2-rc1 (2015-06-10)

- Fix for Unity where delegate was losing location of pointer.

# 0.9.2 (2015-06-08)

- Bug fixes and optimisations surrounding NSOperationQueue and async NSURLConnection objects.

# 0.9.1-rc2 (2015-06-02)

- Fixed iOS7 bug with landscape interstitials, advert was appearing.

# 0.9.1-rc1 (2015-05-27)

- Added device targeting feature.
- Added deep link blocking feature.
- Adverts can respond to, and redirect users to an installed application.

# 0.9.0-rc6 (2015-05-11)

- Unity integration: Bug where UIApplicationDidBecomeActiveNotification observer was being registered late, which doesn't seem to work in the Unity wrapper.

# 0.9.0-rc5 (2015-05-05)

- Fixed issue where interstitial did not close once clicked on.

## 0.9.0-rc4 (2015-04-30)

- Ad frequency duration setting made available in the config dictionary.
- Bootup correctly triggered when application becomes active.

## 0.9.0-rc3 (2015-04-24)

- Fixed issue where test-mode server API calls were receiving 401 responses due to incorrect Basic Authorization header being set.

## 0.9.0-rc2 (2015-04-15)

- Bugfix where internet connection is not present, then becomes available and crashes the app. The pending URL requests array went out of range when failed requests were added back to the operation queue.

## 0.9.0-rc1 (2015-04-13)

- Fixed a number of concurrency bugs surrounding shared states.
