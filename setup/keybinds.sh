#!/bin/bash

# Disable Spotlight shortcut (Command+Space)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "
  <dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
      <key>parameters</key>
      <array>
        <integer>32</integer>
        <integer>49</integer>
        <integer>1048576</integer>
      </array>
      <key>type</key>
      <string>standard</string>
    </dict>
  </dict>
"

echo "Spotlight shortcut (Command+Space) has been disabled. You may need to log out and back in for changes to take effect."
