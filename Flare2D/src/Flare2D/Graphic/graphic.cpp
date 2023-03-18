#include "GLFW/glfw3.h"
#include <iostream>
void glfw_init() {
	std::cout << glfwInit() << std::endl;
}