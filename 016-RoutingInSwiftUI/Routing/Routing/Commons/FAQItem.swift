//
//  FAQItem.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/13/21.
//

import Foundation
import SwiftUI

struct FAQItem: Identifiable {
    var id = UUID()
    var question: String
    var answer: String
    var showContent = true
}

extension FAQItem {
    static func dummyData() -> [FAQItem] {
        return [FAQItem(question: "Fx Studio có phải là blog tốt nhất không?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                FAQItem(question: "Các cách để bạn donate cho Fx Studio?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                FAQItem(question: "Admin của Fx Studio là người như thế nào?", answer: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. "),
                FAQItem(question: "Có bao nhiều channel của Fx Studio?", answer: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. "),
                FAQItem(question: "Bạn có biết fanpage của Fx Studio?", answer: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."),
                FAQItem(question: "Đâu là nơi bạn có thể học Combine & SwiftUI tốt nhất?", answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
                FAQItem(question: "Bạn có thể gởi câu hỏi thông qua các hình thức nào?", answer: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. "),
                FAQItem(question: "Làm thế nào subscribe website?", answer: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. "),
                FAQItem(question: "RxSwift có thực sự tốt không?", answer: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                FAQItem(question: "Tương lại của lập trình iOS sẽ như thế nào?", answer: "Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. ")]
    }
}
