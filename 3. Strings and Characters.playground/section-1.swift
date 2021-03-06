// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Strings are bridged perfectly with NSString class
//
// * All Strings are Unicode compliant
// ------------------------------------------------------------------------------------------------

// Here's a string
var str: String = "Albatross! Get your albatross here!"

// Strings have some special character constants. They are:
"\0"         // Null character
"\\"         // Backslash
"\t"         // Tab
"\n"         // Newline
"\r"         // Carriage return
"\""         // Double quote
"\'"         // Single quote
"\u{24}"       // Single-byte Unicode
"\u{2665}"     // Double-byte unicode
"\u{0001F49c}" // Four-byte unicode

// Initializing an empty string - these are equivalent to each other
var emptyString = ""
var anotherEmptyString = String()

// Use 'isEmpty' to check for empty String
// 判断是否为空,使用isEmpty
if emptyString.isEmpty
{
	"Yep, it's empty"
}

// Strings are VALUE TYPES, but they're referenced for performance so they are only copied on
// modification.
// 值类型,只有在数值改变的时候才会拷贝

// 字符串不是指针，而是实际的值
func somefunc(a: String)
{
	var b = a
	b = "Changed!"
}

var originalString = "Original"
somefunc(originalString)
originalString // not modified

// You can iterate over a string like this:
// 可以for in
// Swift的字符串String就是由字符Character组成的，每一个Character都代表了一个特定的Unicode字符。
for character in originalString
{
	character
}

// Characters use double-quotes to specify them, so you must be explicit if you want a Character
// instead of a String:
// Character也是使用"",所以需要强制指定
var notAString: Character = "t"

// There is no length or count member of string, you have to use the global function,
// 没有lenth函数,需要用全局函数
// countElements()
//
// 有点儿像C语言的strlen函数
// This is much like calling strlen in which it iterates over the Unicode string and counts
// characters. Note that Unicode chars are different lenghts, so this is a non-trivial process.
//
// “Note also that the character count returned by countElements is not always the same as the
// length property of an NSString that contains the same characters. The length of an NSString is
// based on the number of 16-bit code units within the string’s UTF-16 representation and not the
// number of Unicode characters within the string. To reflect this fact, the length property from
// NSString is called utf16count when it is accessed on a Swift String value.”
countElements(originalString)

// Strings can be concatenated with strings and characters
var helloworld = "hello, " + "world"

// ------------------------------------------------------------------------------------------------
// String interpolation
//
// String interpolation refers to referencing values inside of a String. This works different from
// printf-style functions, in that String interpolation allows you to insert the values directly
// in-line with the string, rather than as additional parameters to a formatting function.
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// ------------------------------------------------------------------------------------------------
// String comparison
//
// String comparison is case-sensitive and can be compared for equality
var str1 = "We're a lot alike, you and I."
var str2 = "We're a lot alike, you and I."
str1 == str2

// You can also compare prefix and suffix equality:
/// 前缀比较,后缀比较
str1.hasPrefix("We're")
str2.hasSuffix("I.")
str1.hasPrefix("I.")

