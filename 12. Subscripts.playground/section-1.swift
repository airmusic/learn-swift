// 下标脚本（Subscripts）
// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * Subscripts allow you to declare functionality for instances to make use of the subscript
//   operator ( [] ).
//   下标操作符
//
// * Subscripts are available for classes, structures and enumerations.
//   适用于class,struct,enum
//
// * Subscripts are declared much like getters and setters for properties.
//   跟gettr setter类似
// ------------------------------------------------------------------------------------------------

// Subscripts are declared like getters and setters, and follow the same syntax rules for
// read-only and read-write variants. They also can employ the same syntactic simplifications
// available for getters and setters.
//
// Here's a structure that utilizes a subscript so that we can see the syntax of the declaration.
struct TimesTable
{
	let multiplier: Int
	
	// Read-only subscript using simplified getter syntax
	subscript(index: Int) -> Int
	{
		return multiplier * index
	}

	// Overloaded subscript for type Double, also read-only using the simplified getter syntax
	subscript(index: Double) -> Int
	{
		return multiplier * Int(index)
	}
}

// We can now make use of our newly created subscripts
let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[3]
threeTimesTable[4.0]

// Subscripts can take any parameter type and variadic parameters, but cannot use inout or default
// parameters.
// 不能用Inout
//
// Here's a more complex example:
struct Matrix
{
	let rows: Int
	let columns: Int
	var grid: [Double]
	
	init (rows: Int, columns: Int)
	{
		self.rows = rows
		self.columns = columns
		grid = Array(count: rows * columns, repeatedValue: 0.0)
	}
	
	func indexIsValidForRow(row: Int, column: Int) -> Bool
	{
		return row >= 0 && row < rows && column >= 0 && column < columns
	}
	
	// Subscript with getter & setter as well as dual-parameter subscript
	subscript(row: Int, column: Int) -> Double
	{
		get
		{
			assert(indexIsValidForRow(row, column: column), "Index out of range")
			return grid[row * columns + column]
		}
		set
		{
			assert(indexIsValidForRow(row, column: column), "Index out of range")
			grid[row * columns + column] = newValue
		}
	}
}

// We'll create a standard 4x4 identity matrix
// 创建一个矩阵
var matrix = Matrix(rows: 4, columns: 4)
matrix[0,0] = 1
matrix[1,1] = 1
matrix[2,2] = 1
matrix[3,3] = 1
