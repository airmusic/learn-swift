// ------------------------------------------------------------------------------------------------
// Things to know:
//
// * There is no default base class for Swift objects. Any class that doesn't derive from
//   another class is a base class.
//   Swift Object无默认基类,一个不继承任何的类的类就是基类
// ------------------------------------------------------------------------------------------------

// Let's start with a simple base class:
// 简单基类
class Vehicle
{
    var numberOfWheels: Int
    var maxPassengers: Int
    
    func description() -> String
    {
        return "\(numberOfWheels) wheels; up to \(self.maxPassengers) passengers"
    }
    
    // Must initialize any properties that do not have a default value
    init()
    {
        numberOfWheels = 0
        maxPassengers = 1
    }
}

// ------------------------------------------------------------------------------------------------
// Subclasses
//
// Now let's subclass the Vehicle to create a two-wheeled vehicle called a Bicycle
// 自行车继承自2轮子交通工具
class Bicycle: Vehicle
{
    override init() {
        super.init()
        numberOfWheels = 2
    }
    // We'll make this a 2-wheeled vehicle
}

// We can call a member from the superclass
// 调用父类方法
let bicycle = Bicycle()
bicycle.description()

// Subclasses can also be subclassed
// 单向继承
class Tandem: Bicycle
{
    // This bicycle has 2 passengers
    override init()
    {
        super.init()
        maxPassengers = 2
    }
}

// Here, we'll create a car that includes a new description by overriding the superclass' instance
// method
// 车车
class Car: Vehicle
{
    // Adding a new property
    // 添加新的属性
    var speed: Double = 0.0
    
    // New initialization, starting with super.init()
    // 新的初始化
    override init()
    {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    
    // Using the override keyword to specify that we're overriding a function up the inheritance
    // chain. It is a compilation error to leave out 'override' if a method exists up the chain.
    // 使用override重写父类成员方法,不使用会报错
    override func description() -> String
    {
        // We start with the default implementation of description then tack our stuff onto it
        // start with super.desc
        return super.description() + "; " + "traveling at \(speed) mph"
    }
}

// Here, we'll check our description to see that it does indeed give us something different from
// the superclass' default description:
let car = Car()
car.speed = 55
car.description()

// ------------------------------------------------------------------------------------------------
// Overriding Properties
// 重写属性
//
// We can override property getters and setters. This applies to any property, including stored and
// computed properties
// 我们可以重写属性getter和setter,这个适用于任何属性(store,computed)
//
// When we do this, our overridden property must include the name of the property as well as the
// property's type.
//
class SpeedLimitedCar: Car
{
    // Make sure to specify the name and type
    override var speed: Double
        {
        get
        {
            return super.speed
        }
        // We need a setter since the super's property is read/write
        //
        // However, if the super was read-only, we wouldn't need this setter unless we wanted to
        // add write capability.
        set
        {
            super.speed = min(newValue, 40.0)
        }
    }
}

// We can see our override in action
// 看看是否起作用
var speedLimitedCar = SpeedLimitedCar()
speedLimitedCar.speed = 60
speedLimitedCar.speed

// We can also override property observers
// 重写监听属性
class AutomaticCar: Car
{
    var gear = 1
    override var speed: Double
        {
        // Set the gear based on changes to speed
        didSet { gear = Int(speed / 10.0) + 1 }
        
        // Since we're overriding the property observer, we're not allowed to override the
        // 如果重写了property,就不允许重写setter和getter
        // getter/setter.
        //
        // The following lines will not compile:
        //
        // get { return super.speed }
        // set { super.speed = newValue }
    }
}

// Here is our overridden observers in action
var automaticCar = AutomaticCar()
automaticCar.speed = 35.0
automaticCar.gear

// ------------------------------------------------------------------------------------------------
// Preenting Overrides
// 防止重写
//
// We can prevent a subclass from overriding a particular method or property using the 'final'
// keyword.
// 使用final防止重写
//
// final can be applied to: class, var, func, class methods and subscripts
// class var subscripts都可以用
//
//
// Here, we'll prevent an entire class from being subclassed by applying the . Because of this,
// the finals inside the class are not needed, but are present for descriptive purposes. These
// additional finals may not compile in the future, but they do today:
final class AnotherAutomaticCar: Car
{
    // This variable cannot be overridden
    final var gear = 1
    
    // We can even prevent overridden functions from being further refined
    final override var speed: Double
        {
        didSet { gear = Int(speed / 10.0) + 1 }
    }
}
