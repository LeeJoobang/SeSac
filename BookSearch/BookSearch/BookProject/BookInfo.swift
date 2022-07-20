import Foundation
import UIKit

struct BookInfo {

    let book: [Book] = [
        Book.init(title: "불편한 편의점(40만부 기념 벚꽃 에디션", classification: 4.2, cover: "book1", backgroundColor: .orange),
        Book.init(title: "작별인사", classification: 9.3, cover: "book2", backgroundColor: .blue),
        Book.init(title: "세상의 마지막 기차역", classification: 3.8, cover: "book3", backgroundColor: .brown),
        Book.init(title: "친밀한 이방인", classification: 1.2, cover: "book4", backgroundColor: .darkGray),
        Book.init(title: "어서 오세요, 휴남동 서점입니다.", classification: 9.8, cover: "book5", backgroundColor: .green),
        Book.init(title: "어느 날, 내 죽음에 네가 들어왔다.", classification: 6.7, cover: "book6", backgroundColor: .purple),
        Book.init(title: "저만치 혼자", classification: 3.3, cover: "book7", backgroundColor: .systemRed),
        Book.init(title: "달러구트 꿈 백화점", classification: 7.1, cover: "book8", backgroundColor: .yellow)
    ]  
}
