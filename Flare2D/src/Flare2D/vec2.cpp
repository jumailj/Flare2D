#include "vec2.h"

#include <iostream>

vec2::vec2(int x_, int y_)
{
	x = x_;
	y = y_;
}

void vec2::getVec()
{
	 std::cout << x << " , " << y << std::endl;
}
