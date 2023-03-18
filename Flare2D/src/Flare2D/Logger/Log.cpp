#include "Log.h"

namespace Flare2D {

	 std::shared_ptr<spdlog::logger> Log::s_CoreLogger; // return this logger;
	 std::shared_ptr<spdlog::logger> Log::s_ClientLogger; // return this logger

	 void Log::Init() 
	 {
		 spdlog::set_pattern("[%T.%e] %n: %v %$");

		 s_CoreLogger = spdlog::stdout_color_mt("Flare2D");
		 s_CoreLogger->set_level(spdlog::level::trace);

		 s_ClientLogger = spdlog::stdout_color_mt("client:");
		 s_ClientLogger->set_level(spdlog::level::trace);
	 }
}