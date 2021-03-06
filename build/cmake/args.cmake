#打包参数解析
#这里会根据cmake的参数来设置不同的变量,这些变量在后面的构建中会用到
message(STATUS "parse build args")
if (DEFINED package)
    if (package MATCHES ios)
        if (DEFINED arch)
        else ()
            set(arch arm64)
        endif ()

        if (arch MATCHES arm64)
            set(IOS_ARM64 ON)
        elseif (arch MATCHES armv7)
            set(IOS_ARMV7 ON)
        else ()
            message(FATAL_ERROR "invaild arch,maybe arm64 | armv7")
        endif ()
    elseif (package MATCHES android)
        set(ANDROID_ARMV7A ON)
    elseif (package MATCHES osx)
        set(OSX_64 ON)
    elseif (package MATCHES win)
        if (CMAKE_GENERATOR MATCHES Win64)
            set(arch x64)
            set(WIN_64 ON)
        else ()
            set(arch x32)
            set(WIN_32 ON)
        endif ()
    else ()
        message(FATAL_ERROR "invaild platform,maybe ios | android | osx | win")
    endif ()

    message(STATUS "platform: " ${package})
    if (DEFINED arch)
        message(STATUS "arch: " ${arch})
    else ()
        message(STATUS "arch: " "no speical")
    endif ()
else ()
    if (APPLE)
        set(build osx-dev)
        set(OSX_DEV ON)
    elseif ()
        message(FATAL_ERROR "current platform not supported")
    endif ()
endif ()
