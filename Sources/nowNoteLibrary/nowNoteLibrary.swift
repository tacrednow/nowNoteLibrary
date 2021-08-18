
import Foundation

/// 格式化数字转换为字符串
public func formatterNumberToString(obj: Any?) -> String {
    if let num = obj as? NSNumber {
        let suffixes = ["", "k", "M", "B"]
        var idx = 0
        var d = num.doubleValue
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .decimal
//        formatter.decimalSeparator = "."
//        formatter.groupingSeparator = ","
        if d >= 10000 {
            while idx < 3 && abs(d) >= 1000.0 {
                d /= 1000.0
                idx += 1
            }
            let newD = Double(Int(d * 10)) / 10
            let number = NSNumber(value: newD)
            if let formattedValue = formatter.string(from: number) {
                return formattedValue + suffixes[idx]
            }
            return ""
        }else{
            let number = NSNumber(value: d)
            if let formattedValue = formatter.string(from: number) {
                return formattedValue
            }
            let numStr = String(format: "%.0f", d)
            return numStr
        }
    }
    return ""
}

struct nowNoteLibrary {
    var text = "Hello, World!"
}
