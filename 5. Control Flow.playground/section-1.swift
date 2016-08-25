// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Much of the control flow in Swift is similar to C-like languages, but there are some key
//   differences. For example, switch-case constructs are much more flexible and powerful as well
//   as extensions to break and continue statements.
// 控制语句,大部分和C语言类似,但是也有一些不一样的地方,例如switch-case语句,更加灵活高效
// ------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------
// For loops
// For 循环
//
// We can loop through ranges using the closed-range operator ("...").
// 闭合range和for搭配使用
//
// In the loop below, 'index' is a constant that is automatically declared.
// For循环中,index是一个常量
for index in 1...5
{
	"This will print 5 times"

	// Being a constant, the following line won't compile:
	//
	// index = 99
}

// The constant 'index' from the previous loop is scoped only to the loop. As a result, you cannot
// access it beyond the loop. The following line will not compile:
//
// index = 0
// index for循环内有效

// We can loop through ranges using the half-closed range operator ("..<")
// 半闭range
//
// We can also reuse the name 'index' because of the scoping noted previously.
for index in 1 ..< 5
{
	"This will print 4 times"
}

// Apple's "Swift Programming Language" book states the following, which I find in practice to be
// incorrect:
//
// “The index constant exists only within the scope of the loop. If you want to check the value of
// index after the loop completes, or if you want to work with its value as a variable rather than
// a constant, you must declare it yourself before its use in the loop.”
//
// In practice, I find that the loop constant overrides any local variable/constant and maintains
// its scope to the loop and does not alter the locally defined value:
// indx 被覆盖
var indx = 3999
for indx in 1...5
{
	indx // This ranges from 1 to 5, inclusive

	// 'indx' is still acting like a constant, so this line won't compile:
	//
	// indx++
}

// After the loop, we find that 'indx' still contains the original value of 3999
indx

// We can use an underscore if you don't need access to the loop constant:
// 如果你不要index 你可以用_代替
for _ in 1...10
{
	println("do something")
}

// We can iterate over arrays
// iterate数组
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names
{
	name
}

// We can iterate over a Dictionary's key/value pairs
let numberOfLegs = ["Spider":8, "Ant":6, "Cat":4]
// 字典杠杠滴
for (animalName, legs) in numberOfLegs
{
	animalName
	legs
}

// We can iterate over characters in a String
// 字符串迭代
for character in "Hello"
{
	character
}

// We can use the For-Condition-Increment loop construct, which resembles the C-like variant
//
// Note that the loop value is a variable, not a constant. In fact, they cannot be constant
// because of the increment statement (++index)
// 类似于C语言的for循环结构
for (var index = 0; index < 3; ++index)
{
	index
}

// The parenthesis are optional for the For-Condition-Increment loop:
// 括号是可选的
for var index = 0; index < 3; ++index
{
	index
}

// Variables are scoped to the For-Condition-Increment construct. To alter this, pre-declare index
// 看清楚index变量
var index = 3000
for index = 0; index < 3; ++index
{
	index
}
index // Index holds 3 after running through the loop

// ------------------------------------------------------------------------------------------------
// While loops
//
// While loops resemble other C-like languages. They perform the condition before each iteration
// through the loop:
// While循环
while index > 0
{
	--index
}

// Do-While loops also resemble their C-like language counterparts. They perform the condition
// after each iteration through the loop. As a result, they always execute the code inside the
// loop at least once:
// Do Whilh循环
do
{
	++index
} while (index < 3)

// ------------------------------------------------------------------------------------------------
// Conditional Statements
// 条件语句
//
// The if statement is very similar to C-like languages, except that the parenthesis are optional.
// You can also chain multiple conditions with 'else' and 'else if' statements:
if (index > 0)
{
	"Index is positive"
}
else if index == 0
{
	"index is zero"
}
else
{
	"index is negative"
}

// Switch statements are more powerful than their C-like counterparts. Here are a few of those
// differences to get us started:
// Switch 语句比CLIKE更加强大,下面就是一些例子
//
// Unlike C-like languages, switch statements do not require a "break" statement to prevent falling
// through to the next case.
// 不需要break语句啦
//
// Additionally, multiple conditions can be separated by a comma for a single case to match
// multiple conditions.
// 多个条件可以用逗号分隔
//
// Switch statements must also be exhaustive and include all possible values, or the compiler will
// generate an error.
// 必须包含所有可能的情况,不然会报错
//
// There are many more differences, but let's start with a simple switch statement to get our feet
// wet:
// get one's feet wet
// [释] to start learning something;
let someCharacter: Character = "e"
switch someCharacter
{
	case "a", "e", "i", "o", "u":
		"a vowel"

	case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "u", "z":
		"a consonant"

	// Necessary because switch statements must be exhaustive in order to capture all Characters
	default:
		"not a vowel or consonant"
}

// Each case clause must have a statement of some kind. A comment will not suffice.
// 每个case必须处理一些东西,注释不可行
//
// Otherwise you will get a compilation error. The following won't compile because there is an
// empty case statement:
// 空的case是编译不过的

//
// let anotherCharacter: Character = "a"
// switch anotherCharacter
// {
//		case "a":
//		case "A":
//			"the letter a"
//		default:
//			"not the letter a"
//	}

// We can perform range matching for cases:
// range操作符,搜搜的爽
let count = 3_000_000_000_000
switch count
{
	case 0:
		"no"
	case 1...3:
		"a few"
	case 4...9:
		"several"
	case 10...99:
		"tens of"
	case 100...999:
		"hundreds of"
	case 1000...999999:
		"thousands of"
	default:
		"millions and millions of"
}

// Matching against tuples
// 元组匹配
// In addition to matching Tuples, we can also use ranges inside Tuple values and even match
// against partial Tuple values by using an "_" to ignore matches against a specific value within
// the Tuple.
let somePoint = (1,1)
switch somePoint
{
	case (0,0):
		"origin"

	// Match only against y=0
	case (_, 0):
		"On the X axis"

	// Match only against x=0
	case (0, _):
		"On the y axis"

	// Match x and y from -2 to +2 (inclusive)
	case (-2...2, -2...2):
		"On or inside the 2x2 box"

	// Everything else
	default:
		"Outisde the 2x2 box"
}

// Value bindings in switch statements
// 数值绑定
var anotherPoint = (2, 8)
switch anotherPoint
{
	// Bind 'x' to the first value (matching any x) of the tuple and match on y=0
	case (let x, 0):
		"On the x axis with an x value of \(x)"

	// Bind 'y' to the second value (matching any y) of the tuple and match against x=0
	case (0, let y):
		"On the y axis with an y value of \(y)"

	// Bind both values of the tuple, matching any x or y. Note the shorthand of the 'let'
	// outside of the parenthesis. This works with 'var' as well.
	//
	// Also notice that since this matches any x or y, we fulfill the requirement for an exhaustive
	// switch.
	case let (x, y):
		"Somewhere else on \(x), \(y)"
}

// We can also mix let/var for case statements. The following code block is the same as the
// previous except that the final case statement, which mixes variable and constants for the x and
// y components of the Tuple.

// mix let/var
switch anotherPoint
{
	case (let x, 0):
		"On the x axis with an x value of \(x)"

	case (0, let y):
		"On the y axis with an y value of \(y)"

	case (var x, let y):
		++x // We can modify the variable 'x', but not the constant 'y'
		"Somewhere else on \(x), \(y)"
}

// Where clauses allow us to perform more detailed conditions on case conditions. The where clauses
// work on the values declared on the case line:

// case where ,有点儿像linq
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint
{
	case let (x, y) where x == y:
		"On the line of x == y"

	case let (x, y) where x == -y:
		"On the line of x == -y"

	case let (x, y):
		"Just some arbitrary point"
}

// ------------------------------------------------------------------------------------------------
// Control transfer statements
// 控制transfer
//
// Swift supports extended versions of continue and break as well as an additional 'fallthrough'
// statement for switch-case constructs.
// 语句穿透
//
// Since swift doesn't require a break statement to avoid falling through to the next case, we can
// still use them to early-out of the current case without continuing work. The first statement
// after the 'break' will be the next statement following the entire switch construct.
// 尽快不需要break来防止穿透,但是可以通过break提前结束break语句
let someValue = 9000
switch someValue
{
	case let x where (x & 1) == 1:
		if someValue < 100
		{
			"Odd number less than 100"
			break
		}
		"Odd number greater or equal to 100"

	case let x where (x & 1) == 0:
		if someValue < 100
		{
			"Even number less than 100"
			break
		}
		"Even number greater or equal to 100"

	default:
		"Unknown value"
}

// Since each case must have a statement and since we must have an exhaustive switch, we can use
// the break statement to effectively nullify the use of a case:
// 可以使用break,来代替default输出
switch someValue
{
	case Int.min...100:
		"Small number"

	case 101...1000:
		break // We don't care about medium numbers

	case 1001...100_00:
		"Big number"

	default:
		break // We don't care about the rest, either
}

// Since we don't need to break out of cases to avoid falling through automatically, we must
// specifically express our intention to fall through using the 'fallthrough' keyword
// 如果你需要fallthrough,那就加个fallthrough关键字
let integerToDescribe = 5
var integerDescription = "\(integerToDescribe) is" (字符翻译,这个在ruby里面很常用)
switch integerToDescribe
{
	case 2, 3, 5, 7, 11, 13, 17, 19:
		integerDescription += " a prime number, and also"
		fallthrough

	default:
		integerDescription += " an integer."
}

// Continue and Break statements have been extended in Swift to allow each to specify which
// switch or loop construct to break out of, or continue to.
//
// To enable this, labels are used, similar to labels used by C's goto statement.
// 标签,C语言的Goto

//
// The following will print each name until it reaches the letter 'a' then skip to the next name
// 指定break什么东西,下面的break是break For循环
var result = ""
nameLoop: for name in names
{
	characterLoop: for character in name
	{
		theSwitch: switch character
		{
			case "a":
				// Break out of the theSwitch and characterLoop
				break characterLoop

			default:
				result += String(character)
		}
	}
}
result

// Similarly, this prints all names without the letter 'a' in them:
// continue 的使用方法
result = ""
nameLoop: for name in names
{
	characterLoop: for character in name
	{
		theSwitch: switch character
		{
			case "a":
				// Continue directly to the character loop, bypassing this character in this name
				continue characterLoop

			default:
				result += String(character)
		}
	}
}
result

// Similarly, this prints all names until the letter 'x' is found, then aborts all processing by
// breaking out of the outer loop:
// 明确的指定break什么东西,这个比较舒服一些,代码会更加简洁
result = ""
nameLoop: for name in names
{
	characterLoop: for character in name
	{
		theSwitch: switch character
		{
			case "x":
				// Break completely out of the outer name loop
				break nameLoop

			default:
				result += String(character)
		}
	}
}
result
