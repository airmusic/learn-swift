// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Type Aliases allow you to provide a different name for types,
//   similar to 'typedef' in C.
// ------------------------------------------------------------------------------------------------
// 类型别名，类似于C语言的宏定义

// Create an alias for UInt16 called "AudioSample"
typealias AudioSample = UInt16

// This actually calls UInt16.min
var maxAmplituedFound = AudioSample.min

// We can also typealias custom types
// 类型别名，可用于自定义类型
struct MySimpleStruct
{
	static let a = 99
}

typealias MyAliasedName = MySimpleStruct
MyAliasedName.a

