// CPPStaticLIBWrapper.h

#pragma once

using namespace System;

#ifdef _M_X64
#define Alias(func) comment(linker, "/export:" add "=" add)
#else
#define Alias(add) comment(linker, "/export:" add "=_" add)
#endif

#pragma Alias("add")
//#pragma Alias("ifunc")

namespace CPPStaticLIBWrapper {

	public ref class Class1
	{
		// TODO: Add your methods for this class here.
	};

}
