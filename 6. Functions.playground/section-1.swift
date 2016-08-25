// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Like most other languages, functions contain units of code to perform a task, but there are
//   a few key featurs of functions in Swift.
//
// * Functions are types in Swift. This means that a function can receive another function as an
//   input parameter or return a function as a result. You can even declare variables that are
//   functions.
//
// * Functions can be nested, and the inner function can be returned by the outer function. To
//   enable this, the current state of any local variables (local to the outer function) that are
//   used by the inner function are "captured" for use by the inner function. Any time that inner
//   function is called, it uses this captured state. This is the case even when a nested function
//   is returned by the parent function.
// ------------------------------------------------------------------------------------------------

// Here's a simple function that receives a Single string and returns a String
//
// Note that each parameter has a local name (for use within the function) and a standard type
// annotation. The return value's type is at the end of the function, following the ->.
func sayHello(personName: String) -> String
{
    return "Hello, \(personName)"
}

// If we call the function, we'll receive the greeting
// 函数调用
sayHello("Peter Parker")

// Multiple input parameters are separated by a comma
// 多个参数,使用逗号分隔
func halfOpenRangeLength(start: Int, end: Int) -> Int
{
    return end - start
}

// A function with no parameters simply has an empty set of parenthesis following the function
// name:
// 无参函数
func sayHelloWorld() -> String
{
    return "Hello, world"
}

// A funciton with no return value can be expressed in two different ways. The first is to replace
// the return type with a set of empty parenthesis, which can be thought of as an empty Tuple.
// 无返回值
func sayGoodbye(name: String) -> ()
{
    "Goodbye, \(name)"
}

// We can also remove the return type (and the -> delimiter) alltogether:
// 直接不要->()
func sayGoodbyeToMyLittleFriend(name: String)
{
    "Goodbye, \(name)"
}

// Functions can return Tuples, which enable them to return multiple values.
//
// The following function simply returns two hard-coded strings.
// 返回元组,这样函数可以返回多个值
func getApplicationNameAndVersion() -> (String, String)
{
    return ("Modaferator", "v1.0")
}

// Since the return value is a Tuple, we can use the Tuple's naming feature to name the values
// being returned:
// 可是使用tuple Key
func getApplicationInfo() -> (name: String, version: String)
{
    return ("Modaferator", "v1.0")
}
var appInfo = getApplicationInfo()
appInfo.name
appInfo.version

// ------------------------------------------------------------------------------------------------
// External Parameter Names
// 类似于python,传入参数的是,带上参数名
//
// We can use Objective-C-like external parameter names so the caller must name the external
// parameters when they call the function. The extenal name appears before the local name.
// 外部参数名,在传入的时候必须带上,这样可以有效的解决,默认参数问题
func addSeventeen(toNumber value: Int) -> Int
{
    return value + 17
}
addSeventeen(toNumber: 42)

// If your internal and external names are the same, you can use a shorthand #name syntax to create
// both names at once.
// 外部参数和local参数一致,可以直接用#代替
// swift3.0 去掉了这个特性
//
// The following declaration creates an internal parameter named "action" as well as an external
// parameter named "action":

func kangaroosCan(action action: String) -> String
{
    return "A Kangaroo can \(action)"
}
kangaroosCan(action: "hahh")
// We can now use the external name ("action") to make the call:
kangaroosCan(action: "jump")
kangaroosCan(action: "carry children in their pouches")

// We can also have default parameter values. Default parameter values must be placed at the end
// of the parameter list.
// 默认参数名称,必须放在最后面

//
// In the addMul routine, we'll add two numbers and multiply the result by an optional multiplier
// value. We will default the multiplier to 1 so that if the parameter is not specified, the
// multiplication won't affect the result.
func addMul(firstAdder: Int, secondAdder: Int, multiplier: Int = 1) -> Int
{
    return (firstAdder + secondAdder) * multiplier
}

// We can call with just two parameters to add them together
addMul(1, secondAdder: 2)
addMul(3, secondAdder: 3, multiplier: 3)


// Default parameter values and external names
//
// Swift automatically creates external parameter names for those parameters that have default
// values. Since our declaration of addMul did not specify an external name (either explicitly or
// using the shorthand method), Swift created one for us based on the name of the internal
// parameter name. This acts as if we had defined the third parameter using the "#" shorthand.
//
// Therefore, when calling the function and specifying a value for the defaulted parameter, we
// must provide the default parameter's external name:

// swift会自动创建外部变量,为那些默认参数变量
addMul(1, secondAdder: 2, multiplier: 9)



// We can opt out of the automatic external name for default parameter values by specify an
// external name of "_" like so:
// 使用下划线去掉外部变量名
func anotherAddMul(firstAdder: Int, secondAdder: Int, _ multiplier: Int = 1) -> Int
{
    return (firstAdder + secondAdder) * multiplier
}

// Here, we call without the third parameter as before:
anotherAddMul(1, secondAdder: 2)

// And now we can call with an un-named third parameter:
anotherAddMul(1, secondAdder: 1, 9)

// ------------------------------------------------------------------------------------------------
// Variadic Parameters
//
// Variadic parameters allow you to call functions with zero or more values of a specified type.
// 可变参数,允许你传入0个或者多个参数
//
// Variadic parameters appear within the receiving function as an array of the given type.
// 相当于传入一个数组
//
// A function may only have at most one variadic and it must appear as the last parameter.
// 参数必须最后面
func arithmeticMean(numbers: Double...) -> Double
{
    var total = 0.0
    
    // The variadic, numbers, looks like an array to the internal function so we can just loop
    // through them
    for number in numbers
    {
        total += number
    }
    return numbers.count == 0 ? total : total / Double(numbers.count)
}

// Let's call it with a few parameter lengths. Note that we can call with no parameters, since that
// meets the criteria of a variadic parameter (zero or more).
arithmeticMean()
arithmeticMean(1)
arithmeticMean(1, 2)
arithmeticMean(1, 2, 3)
arithmeticMean(1, 2, 3, 4)
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(1, 2, 3, 4, 5, 6)

// If we want to use variadic parameters and default parameter values, we can do so by making sure
// that the default parameters come before the variadic, at the end of the parameter list:
// 可变参数和默认参数混合使用
func anotherArithmeticMean(initialTotal: Double = 0, numbers: Double...) -> Double
{
    var total = initialTotal
    
    //numbers 数组
    for number in numbers
    {
        total += number
    }
    return numbers.count == 0 ? total : total / Double(numbers.count)
}

// Here, we can still call with no parameters because of the default parameter
anotherArithmeticMean()

// Going forward, we must specify the default parameter's external name (because we didn't opt-out
// of it.) Also, you can see why Swift attempts to enforce the use of external parameter names for
// default parameter values. In this case, it helps us recognize where the defalt parameters leave
// off and the variadic parameters begin:
// 这样可以帮助我们识别可变参数的begin

anotherArithmeticMean(1)
anotherArithmeticMean(1, numbers: 1)
anotherArithmeticMean(1, numbers: 2,3)

//swift 3.0新的变化
func anotherArithmeticMean2(numbers: Double...,initialTotal: Double = 0) -> Double
{
    var total = initialTotal
    
    //numbers 数组
    for number in numbers
    {
        total += number
    }
    return total
    //return numbers.count == 0 ? total : total / Double(numbers.count)
}
anotherArithmeticMean2(1,2,3,initialTotal:2)


// Variadic parameters with external parameter names only apply their external name to the first
// variadic parameter specified in the function call (if present.)
func yetAnotherArithmeticMean(initialTotal: Double = 0, values numbers: Double...) -> Double
{
    var total = initialTotal
    for number in numbers
    {
        total += number
    }
    return numbers.count == 0 ? total : total / Double(numbers.count)
}

// And here we can see the impact on the function call of adding the external name "values" to the
// variadic parameter:
yetAnotherArithmeticMean()
yetAnotherArithmeticMean(1)
yetAnotherArithmeticMean(1, values: 2)
yetAnotherArithmeticMean(1, values: 2, 3)
yetAnotherArithmeticMean(1, values: 2, 3, 4)
yetAnotherArithmeticMean(1, values: 2, 3, 4, 5)
yetAnotherArithmeticMean(1, values: 2, 3, 4, 5, 6)

// ------------------------------------------------------------------------------------------------
// Constant and variable parameters
// 参数为常量或者变量
//
// All function parameters are constant by default. To make them variable, add the var introducer:
// 默认为常量,如果需要变量则需要声明
func padString(str: String, pad: Character, count: Int) -> String
{
    //str =  str //+ Array(count: count, repeatedValue: pad)
    return str
}

var paddedString = "padded with dots"
//padString(paddedString, ".", 10)

// Note that the function does not modify the caller's copy of the string that was passed in
// because the value is still passed by value:
print(paddedString)

// ------------------------------------------------------------------------------------------------
// In-Out Parameters
// 传递引用
//
// In-Out parameters allow us to force a parameter to be passed by reference so those changes can
// persist after the function call.
// 这个就不说了
//
// Note that inout parameters cannot be variadic or have default parameter values.
// 引用传递,不可以是默认参数或者可变参数
//
// We'll write a standard swap function to exercise this:
func swap(inout a: Int, inout b: Int)
{
    let tmp = a
    a = b
    b = tmp
}

// Let's call the swap function to see what happens.
//
// To ensure that the caller is aware that the parameter is an inout (and hence, can modify their
// variable), we must prefix the parameter name with "&".
//
// Note that the variables that will be passed as references may not be defined as constants,
// because it is expected that their values will change:
var one = 1, two = 2

//桉树用&这个符号,真的是太爽了
swap(&one, &two)

// And we can see that 'one' contains a 2 and 'two' contains a 1:
one
two

// ------------------------------------------------------------------------------------------------
// Function types
// 函数类型
//
// The type of a function is comprised of the specific parameter list (the number of parameters as
// well as their type) and the return value's type.
//
//
// The following two functions have the same type.
// 下面的例子中由于参数类型和个数还有返回值是一模一样的,所以他们具有相同的类型
// (Int, Int) -> Int
//
// It's important to note that their type is described as: (Int, Int) -> Int
func add(a: Int, b: Int) -> Int {return a+b}
func mul(a: Int, b: Int) -> Int {return a*b}

// A function that has no parameters or return value would have the type: () -> ()
func nop() -> ()
{
    return
}

// The type of the function below is the same as the one above: () -> ()
//
// It is written in a shorter form, eliminating the return type entirely, but this syntactic
// simplification doesn't alter the way that the function's type is notated:
// 和上面具有相同的函数类型
func doNothing()
{
    return
}

// Using what we know about funciton types, we can define variables that are the type of a function
// 声明一个函数变量
let doMul: (Int, Int) -> Int = mul

// We can now use the variable to perform the function:
doMul(4, 5)

// We can also name our parameters when assigning them to a variable, as well as taking advantage
// of un-named parameters ("_").
// 我们可以重新命名函数的参数,也可以不用

//
// This additional syntactic decoration has a purpose, but it doesn't affect the underlying
// function type, which remains: (Int, Int) -> Int
let doAddMul: (a: Int, b: Int, Int) -> Int = addMul

// Calling the function now requires external names for the first two parameters
// 需要外部参数名
doAddMul(a: 4, b: 2, 55)
doAddMul(a: 1, b: 1, 3)
// We can pass function types as parameters to funcions, too.
// 函数类型当参数

// Here, our first parameter named 'doMulFunc' has the type "(Int, Int) -> Int" followed by two
// parameters, 'a' and 'b' that are used as parameters to the 'doMulFunc' function:
typealias xx = (Int, Int)->Int
func doDoMul(doMulFunc: xx, a: Int, b: Int) -> Int
{
    return doMulFunc(a, b)
}


// We can now pass the function (along with a couple parameters to call it with) to another
// function:
doDoMul(doMul, a: 5, b: 5)


// We can also return function types.
// 返回一个函数类型
//
// The syntax looks a little wird because of the two sets of arrows. To read this, understand that
// the first arrow specifies the return type, and the second arrow is simply part of the function
// type being returned:
//
func getDoMul() -> xx
{
    return doMul
}
let newDoMul = getDoMul()
newDoMul(9, 5)

// Or, an even shorter version that avoids the additional stored value:
getDoMul()(5, 5)
getDoMul()(3, 3)

// Earlier we discussed how functions that do not return values still have a return type that
// includes: -> ()
// 不返回一个值,却还有一返回类型
//
// Here, we'll see this in action by returning a function that doesn't return a value:
func getNop() -> () -> ()
{
    return nop
}

// And we'll call nop (note the second set of parenthesis to make the actual call to nop())
getNop()()

// We can nest functions inside of other functions:
// 闭包函数
func getFive() -> Int
{
    func returnFive() -> Int
    {
        return 5
    }
    
    // Call returnFive() and return the result of that function
    return returnFive()
}

// Calling getFive will return the Int value 5:
getFive()

// You can return nested functions, too:
func getReturnFive() -> () -> Int
{
    func returnFive() -> Int
    {
        return 5
    }
    return returnFive
}

// Calling outerFunc2 will return a function capable of returning the Int value 5:
let returnFive = getReturnFive()

// Here we call the nested function:
returnFive()

