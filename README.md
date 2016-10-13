# WesinCommon

## Extension

### IntExtension ###
对接服务端接口时，传输Data中4位来存储文件长度，一般把Int转byte数组
	
	func getBytes(_ length:Int) -> [UInt8]? {

### DataExtension ###

Data中某段16位数字，可以用下面方法直接获取Int值

	func intValue(in range:Range<Data.Index>) -> Int

使用方式比较Range比较方便，例如data.intValue(in: 0..<4)

### DoubleExtension ###

Double的四舍五入，直接转format是不进行四舍五入的

	func rounded(digit:Int) -> String
	
	func formatRounded(digit:Int) -> String
	
### UISearchBar ###

设置UISearchBar输入框的背景颜色

	func setFieldColor(_ color:UIColor)

## Protocol

