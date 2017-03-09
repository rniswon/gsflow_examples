// CPPStaticLIBWrapper.h

#pragma once

using namespace System;

#ifdef _M_X64
#define Alias(call_modules2) comment(linker, "/export:" call_modules2 "=" call_modules2)
#else
#define Alias(call_modules2) comment(linker, "/export:" call_modules2 "=_" call_modules2)
#endif

#pragma Alias("call_modules2")
//#pragma Alias("ifunc")
//#ifdef _M_X64
//#define Alias(func) comment(linker, "/export:" add "=" add)
//#else
//#define Alias(call_modules_) comment(linker, "/export:" call_modules_ "=_" call_modules)
//#endif
//
//#pragma Alias("call_modules_")



namespace CPPStaticLIBWrapper {

	public ref class Class1
	{
		// TODO: Add your methods for this class here.
	};

}
