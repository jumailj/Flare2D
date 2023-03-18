#include "Flare2D.h"

void glfw_init();

int main(int argc, char* argv[]) {

	Flare2D::Log::Init();
	int a = 1;
	int b = 2;

	FLARE2D_ERROR("Error {0}",a);
	FLARE2D_WARN("WARNING {0}", b);

	glfw_init();
}