import UIKit
var diallingCodes = ["010":"北京","021":"上海","0592":"厦门"]
//读取键值
print(diallingCodes["010"])

//添加或修改元素
diallingCodes["020"] = "广东"

//另一种修改
diallingCodes.updateValue("厦门", forKey: "021")
print(diallingCodes["021"])

//删除元素
diallingCodes["020"] = nil
diallingCodes.removeValue(forKey: "020")

//字典的遍历
for key in diallingCodes.keys
{
    print(key)
}

for value in diallingCodes.values
{
    print(value)
}
