// ------------------------------------------------------------------------------------------------
// Things to know:
//
// Classes and structures can both:
//
// * Define properties to store values
// * Define methods to provide functionality
// * Define subscripts to provide access to their values using subscript syntax
// * Define initializers to set up their initial state
// * Be extended to expand their functionality beyond a default implementation
// * Conform to protocols to provide standard functionality of a certain kind
//
// Only classes have:
//
// * Inheritance enables one class to inherit the characteristics of another.
//   //继承
// * Type casting enables you to check and interpret the type of a class instance at runtime.
//   //类型转换允许在运行时检查和解释一个类实例的类型
// * Deinitializers enable an instance of a class to free up any resources it has assigned.
//   //析构器允许一个类实例释放任何其所被分配的资源
// * Reference counting allows more than one reference to a class instance.
//   //引用计数允许对一个类的多次引用
// ------------------------------------------------------------------------------------------------

// First, let's create a basic structure with a couple of simple properties.
// 首先,创造一个简单的结构体
//
// Our structure must have all of its properties initialized, either with default values or through
// initialization (described later.) For now, we'll just ensure they're all initialized with
// default values.
// 结构体property必须初始化
struct Resolution
{
	var width = 1280
	var height = 1024
}

// Similarly, a basic class with a few properties, fully initialized. Notice that the first
// property is an instance of the Resolution structure.
// 类似的, 一个带属性的类,完全初始化,注意第一个属性是一个结构体实例of Resolution
//
// Also, note that the final member, the 'name' property, does not need to be initialized because
// optionals are initalized to nil by default.
// 最后一个name并不必初始化,nil会被默认赋值
class VideoMode
{
	var resolution = Resolution()
	var interlaced = false
	var frameRate = 0.0
	var name: String?
}

// Here are some instances of our structure and class:
// 类和结构体实例化
var someResolution = Resolution()
var someVideoMode = VideoMode()

// ------------------------------------------------------------------------------------------------
// Accessing properties
// 属性访问
//
// We can access members of the class or structure using the dot operator:
// 通过.进行属性访问,这个和C是一样的
someResolution.width
someVideoMode.resolution.width

// In Objective-C, if an object contained a structure, the sub-properties (the properties of the
// structure inside the object) could not be modified directly. Instead the entire structure would
// have to be replaced completely. This is not the case for Swift.
// 注意： 与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设置了someVideoMode中resolution属性的width这个子属性，以上操作并不需要重新设置resolution属性。
someVideoMode.resolution.width = 2880
someVideoMode.resolution.height = 1800

// ------------------------------------------------------------------------------------------------
// Structures and Enumerations are Value Types
// 结构体和枚举是值类型
//
// This means that when passing an instance of a structure or enumeration to a function (or
// assigning an instance of a structure or enumeration to another value), the structure or
// enumeration is copied.
// 这就意味着当你传一个实例(结构体,枚举)给一个函数,属于拷贝传递
//
// Let's create two independent copies of a Resolution structure
let constantResolution = Resolution()
var variableResolution = constantResolution

// We can modify the variable resolution:
variableResolution.width = 320
variableResolution.height = 200

// We can see that the original (from where the variable copy originated) is unchanged:
// 原数值并不变
constantResolution

// Note that since structures and enumerations are value types, we are unable to modify the
// contents of constant intances.
// 注意不可以修改let 常量
// The following will not compile:
//
// constantResolution.width = 320

// ------------------------------------------------------------------------------------------------
// Classes are Reference Types:
// 类属于引用类型
//
// This means that when passing an instance of an object to a function (or assigning an instance
// of an object to another value), the new value will hold a reference to the original object.
// 这就意味着,我们赋值,新的变量hold原对象的引用
//
// Let's create an object and assign it's instance to another variable:
let constantVideoMode = VideoMode()
// let
var variableVideoMode = constantVideoMode
// var 引用类型

// If we modify the variable..
// 修改数值
variableVideoMode.frameRate = 240

// ...we can see that the other instance is also modified:
// 结构原数值就被改了
constantVideoMode.frameRate

// In addition to this, we can even modify the 'constantVideoMode' instance. This is the case
// because it is a reference type and modifing the contents do not modify the reference itself.
// 我们可以修改一个常量.因为我们
constantVideoMode.frameRate = 24

// We cannot, however, modify the instance variable.
//
// This line of code will not compile:
//
// constantVideoMode = VideoMode

// ------------------------------------------------------------------------------------------------
// Memberwise Initializers for Structure Types
// 成员初始化for struct
//
// We can set the properties without the need to create a specialiized init routine. If a struct
// (not a class) does not have any initializers, then Swift will provide a "Memberwise Initializer"
// for us automatically.
// 不需要通过专门的init初始化,如果一个结构没有initalizers,swift会自动创建
//
// Here's what tha memberwise initializer looks like. It's pretty self-explanatory in that it is
// an initializer that includes one externally named parameter for each property in the structure.
let vga = Resolution(width: 640, height: 480)
let vga2 = Resolution(width: 3, height: 3)

// ------------------------------------------------------------------------------------------------
// Identity operators
// Identity 操作符
//
// Since classes are reference types, we can check to see if they are 'identical' with the
// Identity (===) operator:
// class是引用类型,则需要判断他们是否在同一个内存地址哇,所以就需要===
someVideoMode === variableVideoMode
constantVideoMode === variableVideoMode

// Identical-to is not the same as equal to:
//
// The following line will not compile as it uses the equality operator and VideoMode hasn't
// defined an equality operator:
//
// constantVideoMode == variableVideoMode
