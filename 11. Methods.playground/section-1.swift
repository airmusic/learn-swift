//方法（Methods）
//本页包含内容：

//实例方法(Instance Methods)
//类型方法(Type Methods)
// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Methods can be in the form of Instance Methods, which apply to a given instance of a class
//   struct or enumeration and
//   Type Methods, which apply to the type itself, like static methods
//   静态方法(Type Methods)

//   in C-like languages.
// ------------------------------------------------------------------------------------------------

// Instance Methods
// 实例拥有的方法
//
// Instance methods work on instances of a class, structure or enumeration. In order to call an
// 实例方法(class,struct,enum),如果你要call实例方法,你的先创建一个实例
// 实例方法不能脱离于现存的实例而被调用。
// instance method, you must first instantiate the class, structure or enumeration and then place
// the call on that instance.
//
// Here, we'll create a class with a single instance method:
//
class SomeClass
{
	func doSomething()
	{
		// ...
	}
}

// Since this should be pretty clear, let's jump into parameters for methods with internal and
// external names.
// 给Instance Method添加对应的参数(内参,外参)
//
// The defaults for external names are different for methods than they are for global functions.
//
// For methods, the default behavior is that the caller must always specify all but the first
// external parameter name when calling the method. Member authors need not specify the external
// names for those parameters as the default is to treat all parameters as if they had the "#"
// specifier, which creates an external parameter name that mirrors the local parameter name.
//
// To override this default-external-names-for-second-and-beyond-parameters, specify an "_" as the
// external parameter name for all but the first parameter.
//
// If you want the caller to also use external name for the first parameter, be sure to add your
// own '#' symbol to the local name or specify the external name explicitly.
//
// Here's a class that exercises the various combinations of internal and external name usages:
class Counter
{
	var count = 0;
	
	// No parameters
	func increment()
	{
		count += 1
	}
	
	// One parameter, no external parameter name needed by caller
    // 一个参数,无外参
	func incrementBy(amount: Int)
	{
		count += amount
	}
	
	// One parameter, overriding default behavior to requre caller to use external parameter name
	// on first (and only) parameter
    // 一个参数,需要外参
	func addValueTo(value amount: Int)
	{
		count += amount
	}
	
	// Two parameters. Since no external names are specified, default behavior is implied: Caller
	// need not specify the first parameter's external name, but must specify all others:
	func addTwiceWithExternalImplied(first: Int, second: Int)
	{
		count += first
		count += second
	}
	
	// Two parameters. Using explicit external parameter names on all parameters to force caller
	// to use them for all parameters, including the first.
	func addTwiceWithExternalSpecified(a first: Int, b second: Int)
	{
		count += first
		count += second
	}
	
	// Two parameters. Using the external parameter shorthand ("#") to force caller to use
	// external parameter name on first parameter and defaulting to shared local/external names
	// for the rest.
	func addTwiceWithExternalSpecified2(first: Int, second: Int)
	{
		count += first
		count += second
	}
	
	// Two parameters. Disabling all external names
	func addTwiceWithExternalSpecified3(first: Int, _ second: Int)
	{
		count += first
		count += second
	}
}

// Now let's see how we call each of those functions
var counter = Counter()
counter.increment()
counter.incrementBy(1)
counter.incrementBy(4)
counter.addValueTo(value: 3)
counter.addTwiceWithExternalImplied(50, second: 4)
counter.addTwiceWithExternalSpecified(a: 50, b: 4)
counter.addTwiceWithExternalSpecified2(10, second: 10)
counter.addTwiceWithExternalSpecified3(10, 10)
counter.count

// The 'self' property refers to the current instance of a class, structure or enumeration. For
// C++ developers, think of 'self' as 'this'.
// self 是实例的引用
class Point
{
	var x: Int = 10
	
	func setX(x: Int)
	{
		// Using self to disambiguate from the local parameter
		self.x = x
	}
}
//在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
// ------------------------------------------------------------------------------------------------
// Mutation
//
// Instance methods cannot by default modify properties of structures or enumerations. To enable
// this, mark them as 'mutating':
// 结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。
// 但是，如果你确实需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；
// 并且它做的任何改变在方法结束时还会保留在原始结构中。方法还可以给它隐含的self属性赋值一个全新的实例，这个新实例在方法结束后将替换原来的实例。
struct Point2
{
	var x: Int = 10

	// Note the need for the keyword 'mutating'
    mutating func setX(x: Int)
	{
		self.x = x
	}
}

// We'll create a constant Point2...
let fixedPoint = Point2(x: 3)
var c = fixedPoint
c.setX(2)
print(c)

// Because 'fixedPoint' is constant, we are not allowed to call mutating memthods:
//
// The following line won't compile:
//
// fixedPoint.setX(4)

// If you're working with a structure or enumeration (not a class), uou can assign to 'self'
// directly
// 如果你work with sturct你可以直接给self赋值
struct Point3
{
	var x = 0
	
	// This does not work with classes
	mutating func replaceMe(newX: Int)
	{
		self = Point3(x: newX)
	}
}

var p1 = Point3(x: 3)
print(p1)
p1.replaceMe(4)
print(p1)

// Assigning to 'self' in an enumeration is used to change to a different member of the same
// enumeration:
// 给self赋值
enum TriStateSwitch
{
	case Off, Low, High
	mutating func next()
	{
		switch self
		{
		case Off:
			self = Low
		case Low:
			self = High
		case High:
			self = Off
		}
	}
}
var T1 = TriStateSwitch.Low
T1.next()
print(T1)


// 实例方法是被类型的某个实例调用的方法。你也可以定义类型本身调用的方法，这种方法就叫做类型方法。
// 声明类的类型方法，在方法的func关键字之前加上关键字class；声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。
// ------------------------------------------------------------------------------------------------
// Type Methods
//
// Type methods are like C++'s static methods.
//
// They can only access Type members.
struct LevelTracker
{
	var currentLevel = 1
	static var highestUnlockedLevel = 1
	
	static func unlockedLevel(level: Int)
	{
		if level > highestUnlockedLevel
		{
			highestUnlockedLevel = level
		}
	}
	static func levelIsUnlocked(level: Int) -> Bool
	{
		return level <= highestUnlockedLevel
	}
	mutating func advanceToLevel(level: Int) -> Bool
	{
		if LevelTracker.levelIsUnlocked(level)
		{
			currentLevel = level
			return true
		}
		else
		{
			return false
		}
	}
}

// To call a type method, use the type name, not the instance name:
LevelTracker.levelIsUnlocked(3)

// If we attempt to use an instance to call a type method, we'll get an error
// 注意:Instance Call Will Get Error
var levelTracker = LevelTracker()

// The following line will not compile:
//
// levelTracker.levelIsUnlocked(3)

// For classes, type methods use the 'class' keyword rather than the 'static' keyword:
// 类里面推荐还是class关键字
class SomeOtherClass
{
	static func isGreaterThan100(value: Int) -> Bool
	{
		return value > 100
	}
}

// We call class type methods with the type name just as we do for structures and enumerations:
SomeOtherClass.isGreaterThan100(105)
