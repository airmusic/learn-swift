// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Swift is Apple's new programming language for iOS and OSX. If you know C or Objective-C, then
//   these playgrounds should serve as a solid primer for making the switch to Swift.
//
// * Some experience programming in a C-like langauge is expected. If not, then I'm sorry but
//   you're just not the target audience.
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------
// 摘要:
//
// * 
//   these playgrounds should serve as a solid primer for making the switch to Swift.
//
// * Some experience programming in a C-like langauge is expected. If not, then I'm sorry but
//   you're just not the target audience.
// ------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------
// Constants & Variables - These are known as "Stored Values" in Swift
// 常量 & 变量 

// Use the 'let' keyword to define a constant
// 使用let关键字定义常量
let maximumNumberOfLoginAttempts = 10

// Use the 'var' keyword to define a variable
// 使用ver关键字定义变量
// Tip: only use variables when you need a stored value that changes. Otherwise, prefer constants.
// 提示: 当存储的数值需要改变时,使用变量更加(prefer)
var currentLoginAttempt = 0

// Constants cannot change. This line wouldn't compile:
// 常量不可以修改
// maximumNumberOfLoginAttempts = 9

// Variables can change:
// 变量可以修改
currentLoginAttempt += 1

// You also can't redeclare a variable or constant once it has been declared. These lines
// won't compile:
// 不可重复声明常量和变量

// let maximumNumberOfLoginAttempts = 10
// var currentLoginAttempt = "Some string which is not an Int"

// You can combine them on a single line with a comma
// 单行声明常量变量,逗号分隔
let a = 10, b = 20, c = 30
var x = 0.0, y = 0.0, z = 0.0

// Specifying the type with type annotations
// 同过type annotations给变量常量指定类型
//
// The built-in types in Swift are: Int, Double, Float, Bool, String, Array, Dictionary
// There are variations of these (like UInt16), but those are the basic types. Note that all of
// these types are capitalized.
//
// Because of inference (assuming 42 is an Int an "some text" is a String), type annotations are
// usually pretty rare in Swift
//
// Here's how you specify the type. If we didn't specify the type as Double, the type would have
// been inferred to be Int.
// 如果默认类型推断不是你想要的,你必须指定对应的类型
var SomeDouble: Double = 4

// Constant & Variable names cannot contain any mathematical symbols, arrows private-use (or
// invalid) Unicode code points or line-and-box drawing characters. Nor can they begin with a
// number. Otherwise, it's open season for naming your variables! (yes, really!)
//
// Here are some oddly named, but perfectly valid, constants:
// 变量名规则跟C一样,不需太记忆,正常使用即可
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// You can print a value using println
// 使用println函数打印对应的数值
let fiveHundred = 500
println("The current value of fiveHundred is: \(fiveHundred)")

// Since we're using Playgrounds, we'll just put the raw string on the line which is an expression
// that evaluates to itself, printing the result in the right-hand pane in the playground, like so:
"The current value of fiveHundred is: \(fiveHundred)"

// ------------------------------------------------------------------------------------------------
// A note about variable names
//
// As with most languages, you cannot give an identifier (such as a variable or constant name,
// class name, etc.) the same name as a keyword. For example, you can't define a constant named
// "let":
//
// The following line of code will not compile:
//
// let let = 0
//
// However, sometimes it would be convenient to do so and Swift provides a means to enable this
// by surrounding the identifier with backticks (`). Here's an example:
// 如果变量名与关键字冲突使用``进行转义,但是SB才会这么用
let `let` = 42.0

// We can now use `let` like any normal variable:
x = `let`

// This works for any keyword:
let `class` = "class"
let `do` = "do"
let `for` = "for"

// Additionally, it's important to know that this works on non-colliding identifier names:
// 非关键字,转义了也没啥用
let `myConstant` = 123.456

// Also note that `myConstant` and myConstant refer to the same constant:
myConstant

// ------------------------------------------------------------------------------------------------
// Comments
// 注释跟C语言一模一样
//
// You've probably already figured this out, but anything after the "//" is a comment. There's more
// to comments, though:

/* This is a comment
   that spans multiple lines */

// The multi-line comments are handy because they can nest, which allows you to safely comment out
// blocks of code, even if they have multi-line comments in them:

/* 
	// Some variable
	var someVar = 10

	/* A function
     * 
     * This is a common way to comment functions, but it makes it difficult to comment out these
     * blocks.
     */
    func doSomething()
    {
		return
    }
*/

// ------------------------------------------------------------------------------------------------
// Semicolons
// 分号
//
// Semicolons on the end of a line are optional, but the preferred style for Swift is to not use
// them to terminate lines.
// 行末分号是可有可无的,但是尽量别用
var foo1 = 0
var foo2 = 0; // optional semicolon

// However, if you want to put two lines of code on one line, you'll need the semicolon to separate
// them.
// 两行代码放在一行的时候,必须使用分号
foo1 = 1; foo2 = 2

// ------------------------------------------------------------------------------------------------
// Integers
// 整型
//
// There are multiple types of integers. Signed and unsigned with sizes of 8, 16, 32 and 64 bits.
// Here are a couple samples:
// 整数的类型类型很多
let meaningOfLife: UInt8 = 42 // Unsigned 8-bit integer
let randomNumber: Int32 = -34 // Signed 32-bit integer

// There is also Int and UInt, the defaults. These will default to the size of the current
// platform's native word size. On 32-bit platforms, Int will be equivalent to Int32/UInt32. On
// 64-bit platforms it is equivalent to Int64/UInt64.
//
// Similarly, there is
//
// Tip: For code interoperability, prefer Int over its counterparts.
let tirePressurePSI = 52

// To find the bounds of any integer, try ".min" or ".max"
// 整数边界
UInt8.min
UInt8.max
Int32.min
Int32.max

// ------------------------------------------------------------------------------------------------
// Floating point numbers
//
// Double is a 64-bit floating point numbers and Float is a 32-bit floating point number
// 浮点,包括double和float
let pi: Double = 3.14159
let pie: Float = 100 // ... becase it's 100% delicious!

// ------------------------------------------------------------------------------------------------
// Type Safety and Type Inference
//
// Swift is a strongly typed language, and as such, every stored value MUST have a type and can
// only be used where that specific type is expected.
//
// 类型安全和数据推断(类似于python)

// Integer literals are inferred to be Int
// 整数推断为int
let someInt = 1234

// Floating point literals are always inferred to be Double
// 浮点数推断为double
let someDouble = 1234.56

// If you want a Float instead, you must use type annotation
// 如果你想要float类型那你得指定类型
let someFloat: Float = 1234.56

// String literals are inferred to be String type
let someString = "This will be a String"

// Here's a bool
let someBool = true

// These lines won't compile because we are specifying a type that doesn't match the given value
// 由于类型和赋值不匹配,下面编译不过
// let someBool: Bool = 19
// let someInteger: Int = "45"
// let someOtherInt: Int = 45.6

// ------------------------------------------------------------------------------------------------
// Numeric literals
//
// You can specify numbers in a few interesting ways
// 赋值可以使用不同方式,10进制,2进制,8进制,16进制
let decimalInteger = 17
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // ...also 17 (Octal, baby!)
let hexInteger = 0x11 // ...and 17 in Hexidecimal

// Floating point numbers can be specified in a few different ways as well. Here are a few raw
// examples (not assigned to variables):
1.25e2 // Scientific notation
1.25e-2
0xFp2 // Break this down into "0xF", "p", "2". Read as 15 (0xF) to the power of (p) 2, which is 60
0xFp-2
0xC.3p0

// We can pad our literals as well:
// 前面可以加0补齐,下划线会被忽略
000123.456 // Zero padding
0__123.456 // Underscores are just ignored

// Numeric type conversion
// 类型转换

// A number that won't fit in the given type will not compile
// let cannotBeNegative: UInt8 = -1
// let tooBig: Int8 = Int8.max + 1

// Since the default type for numeric values is Int, you need to specify a different type
let simpleInt = 2_000 // Int
let twoThousand: UInt16 = 2_000 // Specified as UInt16
let one: UInt8 = 1 // Specified as UInt8

// This will infer a UInt16 based on the types of both operands
let twoThousandAndOne = twoThousand + UInt16(one)

// Conversions between integer and floating point types must be made explicit
// 强制转换
let three = 3 // Inferred to be Int
let pointOneFourOneFiveNine = 0.14159 // Inferred to be Double
let doublePi = Double(three) + pointOneFourOneFiveNine // Explicit conversion of Int to Double

// The inverse is also true - conversion from floating point to integer must be explicit
//
// Conversions to integer types from floating point simply truncate the fractional part. So
// doublePi becomes 3 and -doublePi becomes -3
let integerPi = Int(doublePi)
let negativePi = Int(-doublePi)

// Literal numerics work a little differently since the literal values don't have an explicit
// type assigned to them. Their type is only inferred at the point they are evaluated.
// 数据推断只会在计算的时候被推断出来
let someValue = 3 + 0.14159
