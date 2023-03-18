#include "Flare2D.h"

int main(int argc, char* argv[]) {

	Flare2D::Log::Init();
	int a = 20;

	FLARE2D_ERROR("I'M YOUR ERROR {0}",a);


}