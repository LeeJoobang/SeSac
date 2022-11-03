import Foundation

extension String {
    
    //jack >>>> [1] >>>> a 인덱스에 대한 값 정보를 가져올 수 있다.
    subscript(idx: Int) -> String? {
        
        guard (0..<count).contains(idx) else {
            return nil
        }
        
        let result = index(startIndex, offsetBy: idx)
        return String(self[result])
        
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// let a = [Phone(), Phone()]

struct Phone {
    var numbers = ["1234", "5679", "3353", "2222"]
    
    subscript(idx: Int) -> String {
        get {
            return self.numbers[idx]
        }
        set {
            self.numbers[idx] = newValue
        }
    }
}
