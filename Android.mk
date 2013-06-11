#
# Copyright (C) 2012 The Android Open Source Project
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
#

# This package provides a layer of abstraction that allows the WebView
# implementation to be replaced in the dependency graph.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := webview
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := libwebcore

# webviewchromium doesn't have makefiles for MIPS yet.
ifneq ($(TARGET_ARCH),mips)
LOCAL_REQUIRED_MODULES += webviewchromium
endif

include $(BUILD_PHONY_PACKAGE)

# webviewchromium doesn't have makefiles for MIPS yet.
ifneq ($(TARGET_ARCH),mips)
# Include all the makefiles for subdirectories.
include $(call all-makefiles-under,$(LOCAL_PATH))
endif