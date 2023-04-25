# Disable Hybernate and Suspend
#!/usr/bin/env bash
## Disabling Hibernation and Sleep ans Suspension
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

echo "Sleep and Hibernation succesfully disabled"
