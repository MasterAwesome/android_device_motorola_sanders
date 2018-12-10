#!/system/bin/sh

# If there is not a persist value, we need to set one
if [ ! -f /data/property/persist.spectrum.profile ]; then
    setprop persist.spectrum.profile 0
fi
