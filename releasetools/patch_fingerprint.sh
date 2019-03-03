#!/sbin/sh
#Extract our fp files here
unzip /system/etc/fp_c212.zip -d /
#Remove N based FP files
rm -f "/system/lib/hw/fingerprint.msm8953.so"
rm -f "/system/lib/lib_fpc_tac_shared.so"
rm -f "/system/lib/libcom_fingerprints_service.so"
rm -f "/system/vendor/bin/hw/android.hardware.biometrics.fingerprint@2.1-service.sanders"
rm -f "/system/vendor/etc/init/android.hardware.biometrics.fingerprint@2.1-service.sanders.rc"
rm -f "/system/vendor/lib/hw/fingerprint.vendor.msm8953.so"
echo "persist.qfp=false" >> /system/build.prop
#Cleanup
rm /system/etc/fp_c212.zip
rm -- "$0"
