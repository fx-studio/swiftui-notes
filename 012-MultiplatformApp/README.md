# 012 - Multiplatform App

Chào bạn đến với series **SwiftUI Notes**. Đây sẽ phần notes về một trong các tính năng mới đến từ Apple và Xcode 12 (mới nhất hiện tại). Phần này sẽ xác nhận thêm sự kì vọng của Apple về SwiftUI. Đó là tương lai của các hệ sinh thái Apple.

### Giới thiệu

Trước đây, bạn muốn phát triển một hệ thống ứng dụng cho nhiều thiết bị trong cùng một hệ sinh thái. Như iOS và MacOS, thì bạn sẽ viết 2 project khác nhau. Điều này khá là mệt mỏi và gây ra nhiều khó khăn.

Với sự ra đời của Swift và các cách tái sử dụng lại code (như Swift Package) thì công việc cũng đỡ vất vả đi nhiều. Nhưng còn một rào cản lớn đó chính là các thành phần giao diện trên từng nền tảng. Mỗi nền tảng sẽ có một cách hiển thị khác nhau.

Bên cạnh đó, chúng ta còn phải xử lý thêm về UX. Người dùng sẽ có nhiều cách sử dụng & tương tác với ứng dụng trên mỗi nền tảng khác nhau. Ví dụ như là sẽ không bao giờ có việc người dùng tay chạm vào các button trong ứng dụng của tvOS.

Cuối cùng, mỗi nền tảng sẽ có những đặc trưng khác nhau. Như MacOS sẽ phải có Menu và Setting View ....v....v.... Tất cả những thứ trên sẽ gây áp lực lên việc làm ...

> Giao diện cho các ứng dụng trên các nền tảng khác nhau.

Điều này đã giải quyết được bằng SwiftUI. Nhưng cái còn kiềm hãm SwiftUI đó chính là Life Cycle. Bạn sẽ bắt buộc dụng một Life Cycle cho một nền tảng nào đó. Ví dụ như với iOS/iPad OS thì đó là UIKit AppDelegate Life Cycle ... Cái bóng của nền tảng vẫn còn quá lớn.

> Cho tới khi ...

Và Apple cũng không phụ lòng dev, với sự ra mắt Xcode 12 thì chúng ta đã có thể sử dụng SwiftUI & SwiftUI App Life Cycle để thực hiện ước mơ của bao đời dev iOS. Đó là ...

> **Multi-platform App**

### Danh sách

1. [Basic Multiplatform App](./01_BasicMultiplatformApp.md)
2. Design & Make color
3. Extra functions

### Lưu ý

Công nghệ mỗi ngày một thay đổi và bạn phải dành ra nhiều thời gian để cập nhất nó hằng ngày. Do đó, các bài viết sẽ mang tính chất giới thiệu và ở mức độ cơ bản mà thôi. Có thể trong quá trình nghiên cứu, mình sẽ bổ sung thêm các phần lý thuyết cho chương này của series.

---

Cảm ơn bạn đã theo dõi các bài viết từ **Fx Studio** & hãy truy cập [website](https://fxstudio.dev/) để cập nhật nhiều hơn!