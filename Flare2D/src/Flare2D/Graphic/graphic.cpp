
#include "glad/glad.h"
#include "GLFW/glfw3.h"

#include "../Logger/Log.h"

void glfw_init() {
	if (!glfwInit()) {
		FLARE2D_CORE_ERROR("GLFW FAILD");
	}
	else {
		FLARE2D_CORE_INFO("GLFW LOADED, Version:{0}", glfwGetVersionString());
	}	
}