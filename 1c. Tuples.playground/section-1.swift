// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Tuples are groups of values combined into a single, compound value
// ------------------------------------------------------------------------------------------------
// 元组数据类型

// Defining a Tuple - use parenthesis around the comma-delimited list of values
// 定义元组- 括号包围一系列逗号分隔的值
//
// This Tuple doesn't specify types, so it relies on inference
// 元组可以通过类型推断来识别
let httpError404 = (404, "Not found")

// We can also specify the type in order to avoid inferrence
// 通过强制指定类型来避免推断
let someOtherTuple = (Double(100), Bool(false))

// Decomposing typles looks like this
let (statusCode, statusMessage) = httpError404
statusCode
statusMessage

// We can also decompose into variables instead of constants, but you probably figured that out
// 元组解压缩
var (varStatusCode, varStatusMessage) = httpError404
varStatusCode
varStatusMessage

// You can also access them with the dot operator followed by their index:
// 可以通过index来得到引用
httpError404.0
httpError404.1

// Alternatively, you can name the elements of a Tuple
// 你个可以取一个名字,类似于字典
let namedTuple = (statusCode: 404, message: "Not found")

// When you name the elements you effectively assign names to their indices, so the dot operator
// works with names or integers:
// .号操作符 可以works with名字和整数
namedTuple.statusCode == namedTuple.0
namedTuple.message == namedTuple.1

