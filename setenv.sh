#!/bin/bash

export GRADLE_OPTS="-Dorg.gradle.native=false -Dorg.gradle.daemon=true"
export NDK_VERSION=r14b
export ANDROID_SDK_VERSION=r25.2.5

if uname -a | grep -q -i darwin; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    export ANDROID_NDK=/usr/local/opt/android-ndk
    export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
    export ANDROID_SDK=/usr/local/opt/android-sdk
    export ANDROID_HOME=/usr/local/opt/android-sdk
else
    export MAVEN_VERSION=3.3.9
    export GRADLE_VERSION=3.4.1
    export NDK_TOOLCHAIN_PLATFORM=14
    export NDK_TOOLCHAIN_ARCHITECTURE=arm
    export NDK_ROOT=`pwd`/installs/android-ndk-${NDK_VERSION}
    export PATH=${NDK_ROOT}:$PATH
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    export ANDROID_NDK_HOME=${NDK_ROOT}
    export ANDROID_HOME=`pwd`/installs/tools
    export PATH=`pwd`/installs/apache-maven-${MAVEN_VERSION}:`pwd`/installs/gradle-${GRADLE_VERSION}/bin:`pwd`/installs/android-toolchain/bin:$PATH
fi

export PATH=$ANDROID_HOME/bin:${ANDROID_NDK_HOME}:$PATH

