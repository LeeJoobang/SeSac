import Foundation

class NewsViewModel {
    
    var pageNumber: CObservable<String> = CObservable("3000")
    
    func changePageNumberFormat(text: String){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let text = text.replacingOccurrences(of: ",", with: "")
        guard let number = Int(text) else { return }
        let result = numberFormatter.string(for: number)!
        pageNumber.value = result
    }
}
