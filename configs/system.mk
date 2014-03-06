# Copyright (C) 2013 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/bin/sysinit:system/bin/sysinit 

# userinit support
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# APN
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Gapps backup script
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/twixkat/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions

# SU Support
PRODUCT_COPY_FILES += \
    vendor/twixkat/prebuilt/bin/su:system/xbin/daemonsu \
    vendor/twixkat/prebuilt/bin/su:system/xbin/su \
    vendor/twixkat/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \
    vendor/twixkat/prebuilt/apk/Superuser.apk:system/app/Superuser.apk
