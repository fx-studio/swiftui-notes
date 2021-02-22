# 007 - 1 : Declarative app development

Phần này chúng ta đi vào cơ bản sử dụng các View hay Control được SwiftUI cung cấp. Chúng nó có điểm khác biệt so với cách truyền thống. Và mình sẽ đi vào từng chủ đề riêng biệt.

> Bắt đầu thôi!

## Khái niệm

Chúng ta sẽ dịch tiêu đề trên như sau: 

> Phát triển ứng dụng khai báo

Nếu bạn đã biết về **Declarative** thì có thể skip phần này. Vì mang tính lý thuyết khái niệm. Còn bạn chưa biết thì có thể lượt nhanh qua để nắm được chút lý thuyết về nó.

Thứ nhất, SwiftUI cho phép bạn phát triển ứng dụng khai báo (**declarative app**). Nó đêm lại một trải nghiệm nhanh hơn nhiều so với cách lập trình hay phát triển app truyền thống trước đây **(imperative app)**.

Thứ hai, **Declarative app development** có nghĩa là bạn phải khai báo cả hai việc một lúc:

* Giao diện của bạn sẽ trông như thế nào.
* Dữ liệu mà giao diện của bạn phụ thuộc vào.

Thứ ba, nhiệm vụ của SwiftUI chính là tạo các view khi chúng xuất hiện và cập nhật lại chúng khi có sự thay đổi từ phái dữ liệu mà chúng phụ thuộc vào.

Còn nhiệm vụ của bạn, ngoài việc thiết kế bố cục các View. Thì còn phải khai báo thêm các trạng thái của các view khi xuất hiện. Và cách để SwiftUI phản ứng lại với sự thay đổi trạng thái dữ liệu mà các view phụ thuộc vào.

Và khi đã nhắc tới phản ứng thì việc kết hợp giữa SwiftUI với **Reactive Programming Framework** là điều không thể thiếu. Với Reactive Programming thì ta có 2 đại diện như sau:

* Combine (hàng chính chủ Apple)
* RxSwift (thế lực mạnh nhất hiện tại)

## Tính năng đặc trưng

Ta có một số tình năng đặc trưng của SwiftUI với Declarative App như sau:

* **Views**: với các Declarative UI thì sẽ đồng bộ với code của bạn. Không cần phải định danh các UI Control khi sử dụng. Bố cục UI kết hợp với dữ liệu nhanh chóng. Phù hợp với nhiều nền tảng khác nhau trong cùng một hệ sinh thái.
* **Data**: Dữ liệu khai báo phụ thuộc sẽ cập nhật view khi dữ liệu thay đổi. SwiftUI sẽ tính toán lại và render lại từng phần mà liên kết với dữ liệu khai báo. Trạng thái của view cũng bị ảnh hưởng với chúng. Bạn phải khai báo cách view hiển thị với từng trạng thái dữ liệu và các phản ứng lại với sự thay đổi của dữ liệu.
* **Navigation**: Điều hướng các view tới các view khác hoặc các màn hình phụ
* **Intergration**: tích hợp UIKit vào SwiftUI. Nhằm tận dụng lại kho tàng mà UIKIt đang có.
