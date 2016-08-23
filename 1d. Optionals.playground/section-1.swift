// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * An optional value is a stored value that can either hold a value or "no value at all"
//
// * This is similar to assigning a stored value to "nil" but Optionals work with any type of
//   stored value, including Int, Bool, etc.
// ------------------------------------------------------------------------------------------------

//知识点
//
//类型可选,主要解决try-cathc问题

// An optional declaration adds a "?" immediately after the explicit type. The following line
// defines a value 'someOptional' that can either hold an Int or no value at all. In this case
// we set an optional Int value to .None (similar to nil)
let someOptional: Int? = .None

// Let's try to convert a String to an Int
// String类型转化为整形
//
// Using the String's toInt() method, we'll try to convert a string to a numeric value. Since not
// all strings can be converted to an Integer, the toInt() returns an optional, "Int?". This way
// we can recognize failed conversions without having to trap exceptions or use other arcane
// methods to recognize the failure.
//
// Here's an optional in action
let notNumber = "abc"
let failedConversion = notNumber.toInt()

// Notice how failedConversion is 'nil', even though it's an Int
// 注意,错误的转化为变成nil
failedConversion

// Let's carry on with a successful conversion
let possibleNumber = "123"
var optionalConvertedNumber = possibleNumber.toInt()

// This one worked
optionalConvertedNumber

// If we assign it to a constant, the type of that constant will be an Optional Int (Int?)
// 如果复制给常量,那么类型将会是一个可选类型(类型后面加?)
let unwrapped = optionalConvertedNumber // 'unwrapped' is another optional

// ------------------------------------------------------------------------------------------------
// Alternate(替代语法) syntax for Optionals
// 语法糖
//
// The use of a "?" for the syntax of an optional is syntactic sugar for the use of the Generic
// Optional type defined in Swift's standard library. We haven't gotten into Generics yet, but
// let's not let that stop us from learning this little detail.
//
// ?号仅仅是语法糖而已
// These two lines are of equivalent types:
let optionalA: String? = .None
let optionalB: Optional<String> = .None

// ------------------------------------------------------------------------------------------------
// Unwrapping
// Optional的拆包
//
// The difference between Int and Int? is important. Optionals essentially "wrap" their contents
// which means that Int and Int? are two different types (with the latter being wrapped in an
// optional.
// Int 和 Int?是两种不同的类型
//
// We can't explicity convert to an Int because that's not the same as an Int?. The following
// line won't compile:
// 我们不能强制类型转化
//
// let unwrappedInt: Int = optionalConvertedNumber

// One way to do this is to "force unwrap" the value using the "!" symbol, like this:
// 唯一的解决方法是加一个感叹号
let unwrappedInt = optionalConvertedNumber!

// Implicit unwrapping isn't very safe because if the optional doesn't hold a value, it will
// generate a runtime error. To verify that is's safe, you can check the optional with an if
// statement.
// 隐士展开可选类型,会产生runtime error,所以在使用可选类型时需要加条件判断
if optionalConvertedNumber != .None
{
	// It's now safe to force-unwrap because we KNOW it has a value
	let anotherUnwrappedInt = optionalConvertedNumber!
}
else
{
	// The optional holds "no value"
	"Nothing to see here, go away"
}

// ------------------------------------------------------------------------------------------------
// Optional Binding
// 可选绑定
//
// We can conditionally store the unwrapped value to a stored value if the optional holds a value.
//
// In the following block, we'll optionally bind the Int value to a constant named 'intValue'
// 下面的代码中,可选变量变为常量
if let intValue = optionalConvertedNumber
{
	// No need to use the "!" suffix as intValue is not optional
	// 不需要加!后缀啦
	intValue

	// In fact, since 'intValue' is an Int (not an Int?) we can't use the force-unwrap. This line
	// of code won't compile:
	// intValue!
}
else
{
	// Note that 'intValue' doesn't exist in this "else" scope
	"No value"
}

// We can still use optional binding to bind to another optional value, if we do so explicitly
// by specifying the type of the stored value that we're binding to.
if let optionalIntValue:Int? = optionalConvertedNumber
{
	// 'optionalIntValue' is still an optional, but it's known to be safe. We can still check
	// it here, though, because it's still an optional. If it weren't optional, this if statement
	// wouldn't compile:
	if optionalIntValue != .None
	{
		// 'optionalIntValue' is optional, so we still use the force-unwrap here:
		"intValue is optional, but has the value \(optionalIntValue!)"
	}
}

// Setting an optional to 'nil' sets it to be contain "no value"
// 如果赋值为nil则为no value
optionalConvertedNumber = nil

// Now if we check it, we see that it holds no value:
// 怎样检查
if optionalConvertedNumber != .None
{
	"optionalConvertedNumber holds a value (\(optionalConvertedNumber))! (this should not happen)"
}
else
{
	"optionalConvertedNumber holds no value"
}

// We can also try optional binding on an empty optional
// Value和No Vaule检查
if let optionalIntValue = optionalConvertedNumber
{
	"optionalIntValue holds a value (\(optionalIntValue))! (this should not happen)"
}
else
{
	"optionalIntValue holds no value"
}

// 哇咔咔,非可选类型,不能使用nil赋值啦
// Because of the introduction of optionals, you can no longer use nil for non-optional
// variables or constants.
//
// The following line will not compile
//
// var failure: String = nil // Won't compile

// The following line will compile, because the String is optional
var noString: String? = nil

// If we create an optional without an initializer, it is automatically initialized to nil. In
// future sections, we'll learn that all values must be initialized before they are used. Because
// of this behavior, this variable is considered initialized, even though it holds no value:
// 如果可选类型不进行初始化,则自动赋值为nil,在未来的选节中,我们将会学习到所有值都需要初始化
var emptyOptional: String?

// Another way to implicitly unwrap an optional is during declaration of a new stored value
//
// Here, we create an optional that we are pretty sure will always hold a value, so we give Swift
// permission to automatically unwrap it whenever it needs to.
//
// Note the type, "String!"
var assumedString: String! = "An implicitly unwrapped optional string"

// Although assumedString is still an optional (and can be treated as one), it will also
// automatically unwrap if we try to use it like a normal String.
//
// Note that we perform no unwrapping in order to assign the value to a normal String
let copyOfAssumedString: String = assumedString

// Since assumedString is still an optional, we can still set it to nil. This is dangerous to do
// because we assumed it is always going to hold a value (and we gave permission to automatically
// unwrap it.) So by doing this, we are taking a risk:
assumedString = nil

// BE SURE that your implicitly unwrapped optionals actually hold values!
//
//
// The following line will compile, but will generate a runtime error because of the automatic
// unwrapping.
//
// let errorString: String = assumedString

// Like any other optional, we can still check if it holds a value:
if assumedString != nil
{
	"We have a value"
}
else
{
	"No value"
}
