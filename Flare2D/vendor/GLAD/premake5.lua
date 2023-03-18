project "GLAD"
    kind "StaticLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}") 


    files {
        "include/glad/glad.h",
        "include/KHR/khrplatform.h",
        "src/glad.c"
    }

    includedirs {
        "include"
    }

    filter "configurations:Debug"
        defines "SANDBOX_DEBUG"
        buildoptions "/MT"	--it uses multithread, static version of the run-time library.[MDd]
        symbols "On" -- it allows us to debug code. line by line. which the exe contain suppoting elements to debug.

    filter "configurations:Release"
        defines "SANDBOX_RELEASE"
        buildoptions "/MT"	--it uses multithread, static version of the run-time library.[MDd]
        optimize "On" -- remove all the debuging datas. 