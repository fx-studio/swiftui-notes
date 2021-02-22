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

## SwiftUI vs. UIKit

Phần này sẽ nói sự khác nhau cơ bản giữa SwiftUI và UIKit. 

Với **UIKit**, bạn cài đặt và tạo giao diện với các UI Control cơ bản. Bạn xác định các `IBOutlet` & `IBAction`. Khi người dùng có tương tác và có sự thay đổi về mặt dữ liệu, thì bạn phải tự cập nhật là giao diện của ứng dụng. 

Bên cạnh đó, nếu như bạn thay đổi tên của các Outlet & Action thì cẩn thận ứng dụng bị crash. Bạn phải tiến hành kết nối lại giữa code và giao diện (từ file *.xib). Đây là nỗi ám ảnh của biết bao thế hệ dev iOS.

Với **SwiftUI**, trước tiên bạn cảm nhận được việc tạo giao diện bố cục một cách nhanh chóng. Không quá phức tạo như AutoLayout hay phải tính toán chi tiết như `set frame`. Mọi thứ bắt đầu tự việc khai báo các view và các dữ liệu ràng buộc chúng. Và khi bạn đã sắp xếp ổn về UI & Data, khi có sự thay đổi dữ liệu phụ thuộc, thì giao diện tự động cập nhật theo.

Quan trong, bạn có thể thất tại Canvas mọi thứ dường như là `real-time`. Những gì bạn code sẽ auto cập nhật sang View. SwiftUI hỗ trợ nhiều trình hiển thị trong cùng file, giúp bạn tiết kiệm thời gian thiết kế giao diện ...

---

Okay! chúng ta sẽ dần dần khai phá từng phần trong SwiftUI. Hẹn gặp bạn ở các phần sau.

