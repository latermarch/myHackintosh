cp acai/usb_eject /usr/bin/
mkdir /usr/local/acai
cp acai/patch /usr/local/acai/
chmod 777 /usr/local/acai/patch
cp acai/com.acai.auto_eject_usb_after_wakeup.plist /Library/LaunchDaemons/
chown root:wheel /Library/LaunchDaemons/com.acai.auto_eject_usb_after_wakeup.plist
chmod 644 /Library/LaunchDaemons/com.acai.auto_eject_usb_after_wakeup.plist
launchctl load /Library/LaunchDaemons/com.acai.auto_eject_usb_after_wakeup.plist
