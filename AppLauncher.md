# Introduction #

Use this simple library from the svn to allow your applications to be launched with MobileStudio.

  * [MSAppLauncher.h](http://mobilestudio.googlecode.com/svn/trunk/MSAppLauncher.h)
  * [MSAppLauncher.m](http://mobilestudio.googlecode.com/svn/trunk/MSAppLauncher.m)

# Details #

To read the first passed argument from LaunchInfo.plist:

```
NSString* argument = [MSAppLauncher readLaunchInfoArgumentsForAppID: @"com.your.app.Here" withApplication: self deletingLaunchPList: TRUE];
```

Which returns nil if no launch info file is found or no arguments are passed.

To launch an application, building a full plist, with the ability to pass many arguments (only one in this example):

```
[MSAppLauncher launchApplication: @"com.googlecode.MobileFinder"
                withArguments: [NSArray arrayWithObjects: absolutePath, nil]
                withApplication: self
                withLaunchingAppID: @"com.your.app.Here"];
```

The file output looks like this:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>MSLaunchedAppArguments</key>
    <array>
        <string>/private/var/root/file.test</string>
    </array>
    <key>MSLaunchedAppIdentifier</key>
    <string>com.googlecode.MobileFinder</string>
    <key>MSLaunchingAppIdentifier</key>
    <string>com.your.app.Here</string>
</dict>
</plist>
```