-- premake5.lua
workspace "Flare2D"
	architecture "x64" -- currently project support 64 bit only.
	configurations{"Debug","Release"} -- currnelty poject supports two config : debug for debugging, release for the optimized version.
	startproject "Sandbox" -- set startup project as Sandbox, which contain actual exe. which run when we press f5 //todo{fix startup project}

	outputdir = "%{cfg.buildcfg}-%{cfg.architecture}" -- it's a variable, later assign to prj dirs. : {debug-x64} {releae-x64}
	
		project "Flare2D" 
				location "Flare2D" -- folder location where all the source code is presented
				kind "StaticLib" -- it will generate a static lib file which later link to the sandbox project.
				language "C++"


				targetdir ("bin/" .. outputdir .. "/%{prj.name}")  -- dir location for libs to be placed
				objdir ("bin-int/" .. outputdir .. "/%{prj.name}"); -- dir location intermediate files

				files {"%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp"} -- include .h, .cpp files in src folder
				includedirs { "%{prj.name}/vendor/spdlog/include"}

			
			filter "configurations:Debug"
				defines "FLARE2D_DEBUG"
				buildoptions "/MT"  --it uses multithread, static version of the run-time library. [MDd]
				symbols "On" -- it allows us to debug code. line by line. which the exe/lib contain supporting elements to debug.

			filter "configurations:Release"
				defines "FLARE2D_RELEASE"
				buildoptions "/MT"   --it uses multithread, static version of the run-time library.[MDd]
				optimize "On" -- remove all the debuging datas. 


		project "Sandbox"
				location "Sandbox"
				kind "ConsoleApp" -- it's a exe file, which contain staticlly linked flare2d lib in it.
				language "C++"

				targetdir ("bin/" .. outputdir .. "/%{prj.name}")  -- dir location for executable/libs
				objdir ("bin-int/" .. outputdir .. "/%{prj.name}"); -- dir location intermediate files


				files {"%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp"} -- include .h, .cpp files in src folder

				includedirs {"Flare2D/src", "Flare2D/vendor/spdlog/include"}
				links {"Flare2D"} -- statically links Flare2D lib file to Sandbox

				filter "configurations:Debug"
					defines "SANDBOX_DEBUG"
					buildoptions "/MT"	--it uses multithread, static version of the run-time library.[MDd]
					symbols "On" -- it allows us to debug code. line by line. which the exe contain suppoting elements to debug.

				filter "configurations:Release"
					defines "SANDBOX_RELEASE"
					buildoptions "/MT"	--it uses multithread, static version of the run-time library.[MDd]
					optimize "On" -- remove all the debuging datas. 
