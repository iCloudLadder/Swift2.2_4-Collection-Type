//: Playground - noun: a place where people can play

import UIKit

// Swift 语言提供 Arrays 、 Sets 和 Dictionaries 三种基本的集合类型用来存储集合数据。他们都是泛型集合(请查看 泛型 那一章)； 而且是值类型，也就是他们的赋值操作是被copy的

// 数组(Arrays)是有序 数据的集。
// 集合(Sets)是无序无重复数据的集。
// 字典(Dictionaries)是无序的键值对的集。

/*
    Arrays 、 Sets 和 Dictionaries 中存储的数据类型一旦确定，则不能再存储其他类型的数据。
*/


// 1. 集合的可变性

/*
    在创建集合后，把这个集合赋值给一个变量(var), 则这个集合是可变的
    若赋值给一个常量(let), 则这个集合是不可变的，其大小，元素都不可改变
 
    所以在使用集合时，若不需要改变集合的大小及元素，尽量声明成常量(let)
 */

let noMutableArray = [0, 1, 2] // 不可变的 存储 Int 类型的 数组
var mutableArray: [String] = Array() // 可变的， 存储 String 类型的 数组
mutableArray += ["One"]







//
// 2. 数组 Array
/*
    Array 在swift中是 结构体，也就是值类型， 
    用来存储 *有序的 *同一类型的 值，同一个数据可以多次存储在不同的下标中
 
 
    语法形式：  数组应该遵循像 Array<Element> 形式， 或者 [Element] 形式
              Element 是这个数组中存储的数据类型，而且是唯一的类型
 
 */


// 创建一个空数组

var emptyArry1 = [Int]() // 存储 Int 类型的 空数组
emptyArry1.append(3)
emptyArry1 = [] // 这种写法 只能在 emptyArry1 确定存储数据类型后才能使用，否则报编译时的错。
                // 这里emptyArry1已经确定存储 Int 类型的值

var emptyArry2: [String] = []
var emptyArry3: [[Int]] = Array() // 存储类型是 数组类型 [Int] 类型


// 创建有默认值的数组

// 存储 Double 类型的数组，有三个元素值都是 3 的数组
let defaultValueArray = Array(count: 3, repeatedValue: 3.0)

// 存储 Float 类型的数组，有三个元素值都是 3 的数组
let defaultValueArray1 = [Double](count: 2, repeatedValue: 2)

// 用 + 号创建数组, 两个存储类型相同的数组才能使用 +
let defaultValueArray2 = defaultValueArray + defaultValueArray1

// 使用字面量创建数组, 元素于元素之间用 , 号隔开
let defaultValueArray3: [String] = ["One", "Two", "Three"]

// Swift 会根据存储的值推断，数组中的存储类型，所以 defaultValueArray3 可以省去 : [String]
var defaultValueArray4 = ["Four", "Five"]


// 访问和修改数组
// 可以使用 Array 的 count 访问数组中 元素的个数
print("defaultValueArray4 have \(defaultValueArray4.count) elements")

// 使用 Bool 类型的 isEmpty 属性 检测数组是否为空，也就是 count 是否为 0
if emptyArry1.isEmpty {
    print("This array is an empty array")
} else {
    print("This array have \(emptyArry1.count) elements ")
}


// 使用 append(_:) 方法在 数组后面添加 元素
defaultValueArray4.append("Six")
// 添加多个元素
defaultValueArray4.appendContentsOf(["Sevent", "Eight"])
// 使用 加法赋值运算符 +＝ 直接在数组后面添加一个活多个相同类型的元素
defaultValueArray4 += ["Nine", "Ten"]

// 使用 下标索引 直接放在数组名后的中括号内，来访问数组中的元素
// **不能越界，否则会导致crash
var firstItem = defaultValueArray4[0]

// 也可以用此方式给某个 下标索引 赋值
defaultValueArray4[0] = "Zero"
defaultValueArray4

// 可以用 区间 方式一次改变一个范围内的值
defaultValueArray4[1...3] = ["One", "Two"] // 把数组第1，2，3的3个元素替换成2个元素
defaultValueArray4

// 可以用空数组 来 删除某个范围的数据
defaultValueArray4[3...4] = []
defaultValueArray4

// 不可以用这种 下标的方式，在数组后面添加数据元素，也就是不能越界
// defaultValueArray4[3...4] = ["Five", "Six"]
// defaultValueArray4[4] = "Five"

// 但是可以这样使用
defaultValueArray4[3...3] = ["Three", "Five"]
// 或者 defaultValueArray4[3..<4] = ["Three", "Five"]

// defaultValueArray4[3] = ["Three", "Four"] // error
defaultValueArray4

// 用 insert(_:atIndex:) 在某个下标位置插入一个相同类型的元素
defaultValueArray4.insert("Four", atIndex: 4)

// 用 insertContentsOf(_:at:) 一次性插入多个元素
defaultValueArray4.insertContentsOf(["0", "1"], at: 5)

// 删除一个元素 removeAtIndex(_:) ，此方法的返回值是被删掉的元素的值
let fiveElement = defaultValueArray4.removeAtIndex(5)
defaultValueArray4

let lastElement = defaultValueArray4.removeLast()
defaultValueArray4

let firstElement = defaultValueArray4.removeFirst()
defaultValueArray4

// 一次性删除 最后 N 个 元素
defaultValueArray4.removeLast(2)
// 一次性删除 前面 N 个 元素
defaultValueArray4.removeFirst(2)

// 一次性 删除所有元素
defaultValueArray4.removeAll()

// ***** 以上在使用下标时，均不能越界，否则会crash

defaultValueArray4 += ["0", "1", "2", "3", "4", "5", "Six"]

// 是否包含一个元素
defaultValueArray4.contains("2")

// 数组的遍历
for element in defaultValueArray4 {
    print(element)
}

// 如果我们同时需要每个数据项的值和索引值,可以使用 enumerate() 方法来进行数组遍历。 
// enumerate() 返回一 个由每一个数据项索引值和数据值组成的元组。

for (index, element) in defaultValueArray4.enumerate() {
    print("index = \(index), element = \(element)")
}

defaultValueArray4.sort(>) // 排序， 闭包章节 会讲

// 映射后 return 的结果，组成新的数组
defaultValueArray4.map { (el) -> String in
    return el + "0"
}


// 用 return true (满足某些条件) 的元素，组成一个新的数组
let filter = defaultValueArray4.filter { (el) -> Bool in
    if let num = Int(el) {
        return true
    }
    return false
}
filter







// 2. 集合 Set

/*
 集合(Set)用来存储相同类型并且没有确定顺序的值。
 当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
 
 Swift的 Set 类型被桥接到 Fundation 中的 NSSet 类。
 */


// 集合类型的哈希值
/*
    一个类型为了存储在集合中,该类型必须是可哈希化的--也就是说,该类型必须提供一个方法来计算它的哈希 值。
    一个哈希值是 Int 类型的,相等的对象哈希值必须相同,比如 a==b ,因此必须 a.hashValue == b.hashValue。
 
 
 Swift 的所有基本类型(比如 String , Int , Double 和 Bool )默认都是可哈希化的,可以作为集合的值的类型或 者字典的键的类型。没有关联值的枚举成员值(在枚举有讲述)默认也是可哈希化的。
 */

/*
 你可以使用你自定义的类型作为集合的值的类型或者是字典的键的类型,但你需要使你的自定义类型符合 Swift 标准库中的 Hashable 协议。符合 Hashable 协议的类型需要提供一个类型为 Int 的可读属性 hashValue 。由类 型的 hashValue 属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。
 
 因为 Hashable 协议符合 Equatable 协议,所以符合该协议的类型也必须提供一个"是否相等"运算符( == )的实 现。这个 Equatable 协议要求任何符合 == 实现的实例间都是一种相等的关系。也就是说,对于 a,b,c 三个值来 说, == 的实现必须满足下面三种情况:
 
 • a == a (自反性)
 • a == b 意味着 b == a (对称性)
 • a == b && b == c 意味着 a == c (传递性)
 */


// 集合类型语法
// Swift 中的 Set 类型被写为 Set<Element> ,这里的 Element 表示 Set 中允许存储的类型,和数组不同的是,集 合没有等价的简化形式。

// 创建和构造一个空的集合
let anEmptySet: Set<String> = []
let emptySet1: Set<String> = Set()


var letters = Set<Character>() // 通过构造器,这里的 letters 变量的类型被推断为 Set<Character>
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("A")
letters = [] // letters 现在是一个空的 Set, 但是它依然是 Set<Character> 类型


// 用数组字面量创建集合

let aSet: Set<String> = ["0", "1"]
// 因swift可以自动推断类型所以可以如下写
var mutableSet: Set = ["0", "1", "2", "3", "4"] // 必须标明 : Set, 否则推断为 Array



// 访问和修改一个集合

// count 属性
print("mutableSet have \(mutableSet.count) items.")

// isEmpty 属性
if mutableSet.isEmpty {
    print("mutableSet is empty")
} else {
    print("mutableSet is not empty")
}

// Set 的 insert(_:) 方法
mutableSet.insert("5")

// Set 的 remove(_:) 方法, Set 包含要删除的元素，则删除并返回这个元素， 否则 返回 nil

let setElement = mutableSet.remove("2")
if let el = setElement {
    print("remove \(el) success")
} else {
    print("mutableSet not contain this element")
}

// Set 中的所有元素可以通过它的 removeAll() 全方法删除。
mutableSet.removeAll()

mutableSet = ["0", "1", "2", "3", "4"]

// contains(_:) 方法去检查 Set 中是否包含一个特定的值

let contain = mutableSet.contains("5")
let contain1 = mutableSet.contains("3")


// 遍历一个集合
for element in mutableSet {
    print(element)
}


// Swift 的 Set 类型没有确定的顺序,为了按照特定顺序来遍历一个 Set 中的值可以使用 sort() 方法,它将根据提供的序列返回一个有序集合.
for element in mutableSet.sort(>) { // > 降序， < 升序 闭包章节会讲
    print(element)
}


// 集合操作

let aSet1: Set = ["1", "2", "3", "4"]
let aSet2: Set = ["3", "4", "5", "6"]

// 相交部分
aSet1.intersect(aSet2)

// 互不相交部分
aSet1.exclusiveOr(aSet2)

// 相合
aSet1.union(aSet2)

// 1 不在 2中的部分
aSet1.subtract(aSet2)


// 集合成员关系和相等
/*
 • 使用“是否相等”运算符( == )来判断两个集合是否包含全部相同的值。
 • 使用 isSubsetOf(_:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
 • 使用 isSupersetOf(_:) 方法来判断一个集合中包含另一个集合中所有的值。
 • 使用 isStrictSubsetOf(_:) 或者 isStrictSupersetOf(_:) 方法来判断一个集合是否是另外一个集合的子集合 或者父集合并且两个集合并不相等。
 • 使用 isDisjointWith(_:) 方法来判断两个集合是否不含有相同的值。

 */








// 3. 字典 Dictionary
/*
 字典是一种存储多个相同类型的值的容器。
 每个值(value)都关联唯一的键(key),键作为字典中的这个值数 据的标识符。
 和数组中的数据项不同,字典中的数据项并没有具体顺序。
 我们在需要通过标识符(键)访问数据 的时候使用字典,这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
 
 Swift 的 Dictionary 类型被桥接到 Foundation 的 NSDictionary 类。
 */



// 字典类型快捷语法
// Swift 的字典使用 Dictionary<Key, Value> 定义,其中 Key 是字典中键的数据类型, Value 是字典中对应于这些 键所存储值的数据类型。
// **** 一个字典的 Key 类型必须遵循 Hashable 协议,就像 Set 的值类型。

// 可以用 [Key: Value] 这样快捷的形式去创建一个字典类型


// 创建一个空字典
let emptyDic: [Int: Double] = Dictionary()
let emptyDic2: [Int: Double] = [:]

var namesOfIntegers = [Int: String]()

namesOfIntegers[1] = "one"
namesOfIntegers = [:]


// 用字典字面量创建字典

// [key 1: value 1, key 2: value 2, key 3: value 3]
let airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var numbers = [1: "one", 2: "two", 3: "three"]

// 访问和修改字典

// 同样有 count 和 isEmpty 属性， 因为他们都 遵循 CollectionType 协议

// 用下标索引 取值， 赋值
numbers[1]

numbers[2] = "Two" // 若 key 对应的有值 则修改， 没有则 添加一对新的键值对
numbers
numbers[4] = "four"
numbers

// 可以用  updateValue(_:forKey:) 方法跟新数据， 
// 这个方法在 key 有对应值时， 返回之前的 oldValue
// 在 key 没有对应值时， 添加这对 新的键值对， 并返回 nil
if let oldValue = numbers.updateValue("Three", forKey: 3) {
    print("The old value was \(oldValue).")
}

if let oldValue = numbers.updateValue("five", forKey: 5) {
    print("The old value was \(oldValue).")
} else {
    print("add the key and the value to numbers")
}


// 删除一个值
numbers
numbers[5] = nil // 有则删除， 没有则不做任何操作
numbers
numbers[8] = nil
numbers

// 相对  removeValueForKey(_:) 方法，key 对应的有值，返回 被删除的值， 没有则返回 nil

if let removeValue = numbers.removeValueForKey(4) {
    print("remove \(removeValue)")
} else {
    print("numbers is not contain the key and value")
}


// 字典遍历

for (key, value) in numbers {
    print("key = \(key), value = \(value)")
}

for key in numbers.keys {
    print(key)
}

for value in numbers.values {
    print(value)
}











