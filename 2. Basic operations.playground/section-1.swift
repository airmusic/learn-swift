// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Assuming knowledge of C here, so a lot will be left out that is the the same, such as
//   "let i = 1 + 2"
//
// * Unary operators work on a single target. Of them, you have prefix operators such as !b or
//   postfix operators such as i++.
// 一元操作符,前缀操作符,后缀操作符
//
// * Binary operators work on two targets and are infix operators because they go between two
//   values, such as a + b
// 二元操作符
//
// * Ternary operators work on three targets. There is only one ternary: a ? b : c.
// 三元操作符
// ------------------------------------------------------------------------------------------------

//http://letsswift.com/2014/06/basic-operators/

// We have our standard assignment operator (=). Note that the assignment operator in Swift does
// not actually return a value, so the statment "if (x = y) {}" will not work. This helps prevent
// accidental assignments during conditionals.
// 标准赋值操作符,赋值操作符并不返回一个值

var a = 10.0
var b = 3.0

// Assignment can also take multiple values (for Tuples):
// 元组赋值
let (x, y) = (5, 6)
x
y

// Aside from the standard mathematics operators (+, -, /, *), there is also the remainder operator
// (%) which is not to be confused with modulo. They work differently because of the way remainders
// are calculated for negative numbers and can be used with floating point values.
// 浮点除法
var c = a / b // Floatng point result
// 浮点取余
var d = a % b // Floating point remainder

// ------------------------------------------------------------------------------------------------
// Range operators
// 范围操作符
//
// The range operator with two dots means up to but NOT including the final value.
//
// This is called the "Half-Closed Range Operator"
// 半封闭区间操作符,不包含尾数
for i in 1..<10
{
	i // prints 1 through 9
}

// The range operator with three dots is inclusive with last value like
//
// This is called the "Closed Range Operator"
// 全闭区间操作符
for i in 1...10
{
	i // prints 1 through 10
}

// ------------------------------------------------------------------------------------------------
// Unary, Binary and Ternary operators
// 一元,二元,三元操作符
//
// Unary prefix operators appear before their taget. Here we increment a then negate it:
// 一元举例
++a
a = -a

// You can also use the uniary + operator, though it doesn't do anything
a = +a

// We have the compound assigment operator
// 复合赋值运算符
a += 10

// The logical NOT
// 逻辑非
var truefalse = true
truefalse = !truefalse

// Unary postfix operators appear after their target: i++
a--
a

// Binary operators are infix because they appear between to targets
// 二元操作符
a + b

// String concatenation uses the + operator:
// 字符串链接
"hello, " + "world"

// To add characters, convert them to a string
let dog: Character = "🐶"
let cow: Character = "🐮"
let dogCow = String(dog) + String(cow)

// Ternary operators work on three targets:
truefalse ? a : b

// ------------------------------------------------------------------------------------------------
// Identity operators
// 身份,统一性操作符
//
// We can test if the object reference refers to the same instance of an object (as opposed to two
// objects that are "equivalent" based on some compare logic.) We do this with the === operator:
class myclass {}
var c1 = myclass()
var c2 = myclass()
c1 === c2
c1 === c1

// String comparisons are case sensitive
// 字符串比较
"abc" == "abc"
"abc" == "ABC"

// ------------------------------------------------------------------------------------------------
// Logical operators
// 逻辑操作符
//
// Comparisons use the logical operators with AND, OR and NOT
// && ||
if (true && false) || !(false && true)
{
	"true"
}
