[1mdiff --git a/power-8952.c b/power-8952.c[m
[1mindex 29d9705..b19cf58 100644[m
[1m--- a/power-8952.c[m
[1m+++ b/power-8952.c[m
[36m@@ -1,5 +1,6 @@[m
 /*[m
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.[m
[32m+[m[32m * Copyright (C) 2018 The LineageOS Project[m
  *[m
  * Redistribution and use in source and binary forms, with or without[m
  * modification, are permitted provided that the following conditions are[m
[36m@@ -103,10 +104,8 @@[m [mint set_interactive_override(int on)[m
         /* Display on. */[m
         if (is_interactive_governor(governor)) {[m
             undo_hint_action(DISPLAY_STATE_HINT_ID);[m
[31m-            display_hint_sent = 0;[m
         }[m
     }[m
[31m-    saved_interactive_mode = !!on;[m
     return HINT_HANDLED;[m
 }[m
 [m
[36m@@ -118,14 +117,10 @@[m [mstatic void process_video_encode_hint(void *metadata)[m
 [m
     ALOGI("Got process_video_encode_hint");[m
 [m
[31m-    if (get_scaling_governor_check_cores(governor,[m
[31m-                sizeof(governor),CPU0) == -1) {[m
[31m-        if (get_scaling_governor_check_cores(governor,[m
[31m-                    sizeof(governor),CPU1) == -1) {[m
[31m-            if (get_scaling_governor_check_cores(governor,[m
[31m-                        sizeof(governor),CPU2) == -1) {[m
[31m-                if (get_scaling_governor_check_cores(governor,[m
[31m-                            sizeof(governor),CPU3) == -1) {[m
[32m+[m[32m    if (get_scaling_governor_check_cores(governor, sizeof(governor), CPU0) == -1) {[m
[32m+[m[32m        if (get_scaling_governor_check_cores(governor, sizeof(governor), CPU1) == -1) {[m
[32m+[m[32m            if (get_scaling_governor_check_cores(governor, sizeof(governor), CPU2) == -1) {[m
[32m+[m[32m                if (get_scaling_governor_check_cores(governor, sizeof(governor), CPU3) == -1) {[m
                     ALOGE("Can't obtain scaling governor.");[m
                     return;[m
                 }[m
[36m@@ -150,7 +145,7 @@[m [mstatic void process_video_encode_hint(void *metadata)[m
 [m
     if (video_encode_metadata.state == 1) {[m
         if (is_interactive_governor(governor)) {[m
[31m-            /* Sched_load and migration_notif*/[m
[32m+[m[32m            /* Sched_load and migration_notif */[m
             int resource_values[] = {[m
                 INT_OP_CLUSTER0_USE_SCHED_LOAD, 0x1,[m
                 INT_OP_CLUSTER1_USE_SCHED_LOAD, 0x1,[m
