#pragma once

#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace Flare2D {
	class Log
	{
	public:
		static void Init();

	private:

		static std::shared_ptr<spdlog::logger> s_CoreLogger; 
		static std::shared_ptr<spdlog::logger> s_ClientLogger; 

	public:

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() {
			return s_CoreLogger;
		}

		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() {
			return s_ClientLogger;
		}
	};
}

//CORE LOG MACROS
#define FLARE2D_CORE_ERROR(...)	::Flare2D::Log::GetCoreLogger()->error(__VA_ARGS__)
#define FLARE2D_CORE_WARN(...)	::Flare2D::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define FLARE2D_CORE_INFO(...)	::Flare2D::Log::GetCoreLogger()->info(__VA_ARGS__)
#define FLARE2D_CORE_TRACE(...)	::Flare2D::Log::GetCoreLogger()->trace(__VA_ARGS__)

//CORE LOG MACROS
#define FLARE2D_ERROR(...)		::Flare2D::Log::GetClientLogger()->error(__VA_ARGS__)
#define FLARE2D_WARN(...)		::Flare2D::Log::GetClientLogger()->warn(__VA_ARGS__)
#define FLARE2D_INFO(...)		::Flare2D::Log::GetClientLogger()->info(__VA_ARGS__)
#define FLARE2D_TRACE(...)		::Flare2D::Log::GetClientLogger()->trace(__VA_ARGS__)
