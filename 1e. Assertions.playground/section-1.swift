// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Assertions only trigger in debug mode and not in published builds
// 断言只在调试模式
//
// * Assertions cause your app to terminate on the line and the debugger jumps to the line
// 断言会引起触发调试
// ------------------------------------------------------------------------------------------------

// Let's start with a value...
let age = 3

// You can assert with a message
assert(age >= 0, "A person's age cannot be negative")

// You can assert without the message
assert(age >= 0)

