# 014.4 - Observation

Chào mừng bạn đến với **Fx Studio**. Chúng ta lại tiếp tục phiêu lưu với **SwiftUI** trong series **SwiftUI Notes**. Chủ đề bài viết này là về **Observation** & cách sử dụng tham chiếu trong *The single source of truth*. Đây cũng là bài viết trong phần State & Data Flow trong SwiftUI.

Nếu mọi việc đã ổn rồi, thì ...

> Bắt đầu thôi!

## Chuẩn bị

Về mặt tool và version, các bạn tham khảo như sau:

- SwiftUI 2.0
- Xcode 12

Về mặt kiến thức, bạn cần biết trước các kiến thức cơ bản với SwiftUI & SwiftUI App. Tham khảo các bài viết sau, nếu bạn chưa đọc qua SwiftUI:

- [Làm quen với SwiftUI](https://fxstudio.dev/swiftui-phan-1-lam-quen-voi-swiftui/)
- [Cơ bản về ứng dụng SwiftUI App](https://fxstudio.dev/swiftui-phan-2-co-ban-ve-ung-dung-swiftui-app/)

*(Mặc định, mình xem như bạn đã biết về cách tạo project với SwiftUI & SwiftUI App rồi.)*

## Kiểu dữ liệu phức tạp

Chúng ta đã tìm hiểu khá là nhiều về **State** & **The single source of truth** rồi. Có thể bạn suy nghĩ rằng:

* Ta có `@State` để tạo ra một nguồn lưu trữ và dữ liệu có thể biến đổi được
* `@Binding` để tạo cầu nối cho việc truyền dữ liệu qua các View khác nhau mà vẫn đảm bảo được cập nhật giá trị tốt
* Các View đều phản ưng với trạng thái dữ liệu để tự cập nhật lại việc hiển thị

Bạn thử suy nghĩ như vậy đã đủ chưa, để bạn có thể tự tin cày nát SwiftUI?

### Vấn đề về cấu trúc dữ liệu

Bạn hãy xem qua ví dụ như sau:

```swift
struct View5: View {
    
    @State var name = "An amazing post!"
    @State var description = "Lorem Ipsum is simply dummy text ...."
    @State var likeCount = 999999
    @State var commentCount = 999999
    
    var body: some View {
        VStack {
            Image(systemName: "photo.fill")
                .resizable()
                .foregroundColor(Color.blue)
                .frame(height: 200.0)
            Text(name)
                .font(.title)
            Divider()
            Text(description)
            Divider()
            HStack {
                Button(action: {
                    // ahihi
                }, label: {
                    Label(
                        title: { Text("\(likeCount)") },
                        icon: { Image(systemName: "hand.thumbsup.fill") })
                })
                Button(action: {
                    // ahihi
                }, label: {
                    Label(
                        title: { Text("\(commentCount)")},
                        icon: { Image(systemName: "text.bubble.fill") })
                })
                Button(action: {
                    // ahihi
                }, label: {
                    Label(
                        title: { Text("Share") },
                        icon: { Image(systemName: "arrowshape.turn.up.right.fill") })
                })
            }.padding()
        }
        .padding()
    }
}
```

Đây là một view cực kì bình thường. Bạn hãy quan sát các biến `@State`. Chúng ta dùng tới 4 biến State để lưu trữ các trạng thái dữ liệu để sử dụng cho View. Và nếu như View của chúng ta phức tạp lên thì giải phải liệt kê khai báo như thế nào sẽ không thực sự ổn cho lắm.

Do đó, vấn đề của bạn sẽ gặp trong thực tế lập trình là cần phải có cấu trúc dữ liệu phù hợp với yêu cầu của dự án. Các cấu trúc này đôi khi sẽ phức tạp hơn nhiều. Ngoài ra, chúng còn mang tính kế thừa hay kết hợp với nhau.

Vì vậy, bạn sẽ phải suy nghĩ các để tạo được các đối tượng State cho các cấu trúc dữ liệu phức tạp như là `struct` & `class`.

### Vấn đề với tham trị

Vấn đề trong thực tế khi phát triển một dự án bằng với SwiftUI hay các ngôn ngữ khác thì không đơn giản như bạn nghĩ.

Model của bạn cần có những cấp trúc phức tạp hơn. Các lựa chọn sẽ là `struct` hay `class`. Và nó tuỳ thuộc vào hoàn cảnh bạn sử dụng. Ngoài ra, bạn cần có sự kế thừa, điều này giúp bạn tránh đi việc dư thừa code quá nhiều.

Đôi lúc bạn chỉ cần một số thuộc tính (properties) của một đối tượng Model có thể mang được các tính chất như của một **Binding** và một **State**. Và thuộc tính đó sẽ ảnh hưởng tới giao diện. Còn với **Class** là một câu chuyện dài. Ahuhu!

> Theo bài trước, kiểu dữ liệu **Struct** sẽ đảm bảo được một phần dữ liệu của một đối tượng mà nó tạo ra. Bạn có thể tham khảo tại [đây](https://github.com/fx-studio/swiftui-notes/blob/main/014-StateDataFlow/02_UserInterfaceState.md#binding-to-a-scoped-value).

Tại sao bạn không dùng Struct ở đây:

* Vì Struct là một kiểu tham trị. Mỗi khi bạn muốn bạn muốn gán nó cho 1 cái gì đó, thì nó sẽ copy và tạo ra một đối tượng mới.
* Thay đổi 1 phần dữ liệu thì cũng phải tạo mới toàn bộ đối tượng mới

Nó làm giảm hiệu suất của chương trình của bạn đi rất nhiều. Gây khó khăn khi quản lý các dữ liệu tập trung.

### Giải pháp với tham chiếu

Sẽ có cần một giải pháp đưa ra để có thể dung hoà các yêu cầu trên và giải quyết được các vấn đề của bạn sẽ gặp khi phát triển dự án trong thực tế.

Bạn cần:

* Một kiểu dữ liệu tham chiếu. Class là đề xuất duy nhất.
* Cho phép lựa chọn được các thuộc tính (properties) nào sẽ là `trigger` để cho UI tự động cập nhật

Do đó, bạn cần phải thiết kế lại các class của bạn với vài yêu cầu cơ bản sau:

* Biến một class bình thường thành một Obsevable Class. Giúp cho bên ngoài có thể lắng nghe giá trị phát ra từ đối tưởng của nó.
* Thể hiện của class sẽ giống như một Publisher
* Khi các thuộc tính thay đổi thì sẽ lợi dụng được tính chất `objectWillChange` mà dùng để xử lý các UI hay logic của chương tình
* Quan trong nhất là không thay đổi quá nhiều các class hiện tại mà ban đang sử dụng.

## Thiết kế

### ObservableObject Protocol

Chúng ta sẽ bắt tay vào việc thực hiện thiết kế trên. Chúng ta có **ObservableObject Protocol** đến từ thư viện Combine của Apple. Nó có thể giúp bạn hiện thực hoá thiết kế.

Bạn chỉ cần implement thêm Protocol trên cho class của bạn là được. Xem ví dụ nha:

```swift
class Movie: ObservableObject {
    // ....
}
```

Hoặc bạn có thể mở rộng class bằng cách implement Protocol đó

```swift
extension Movie: ObservableObject {
    // ....
}
```

Lúc này, các thể hiện của class sẽ giống như là một Publisher. Còn được khuyến mãi thêm một thuộc tính là `objectWillChange`. Nó sẽ phát ra một giá trị khi đối tượng có sự thay đổi.

Quan trọng nhất là bạn không cần phải thêm gì hay thay đổi gì quá lớn cho các class hiện tại bạn đang sử dụng.

### @Published

Chúng ta sẽ sử dụng **Property Wrapper** `@Published` để giúp cho việc **Binding** từng phần (properties) của đối tượng **ObservableObject class**.

Chúng sẽ tự động phát đi các giá trị khi thuộc tính đó có sự thay đổi. Từ đó làm tiền dề cho việc giúp các UI tự động cập nhật lại giao diện khi ràng buộc dữ liệu với các thuộc tính của đối tượng.

Xem ví dụ nha:

```swift
class Movie: ObservableObject, Identifiable {
    
    var id = UUID()
    
    @Published var name: String
    @Published var watched: Bool
    
    init(name: String, watched: Bool = false) {
        self.name = name
        self.watched = watched
    }
}
```

Bạn sẽ thấy ta sử dụng **Property Wrapper** cho 2 thuộc tính `name` & `watched` của class **Movie**.

Tóm tắt cho `@Published` như sau:

* Sẽ áp dụng cho các thuộc tính với các kiểu dữ liệu cơ bản hoặc các class cũng có implement ObservableObject Protocol
* Tránh việc làm dụng nó quá nhiều trong class của bạn
* Nó như là một Single source of truth trong class vậy. Khi bạn có thể ràng buộc với nhiều View hay nhiều đối tượng ở bên ngoài. Vẫn đảm bảo được tính toàn vẹn dữ liệu là duy nhất.
* Bạn có thể Binding 2 chiều tới thuộc tính này
* Là trigger cho việc cập nhập giao diện

## Sử dụng

Cuối cùng sẽ là việc áp dụng nó vào **SwiftUI** và xem nó sẽ dùng như thế nào trong lý thuyết **The single source of truth**.

### The single source of truth

Ở bài trước, ta đã biết với khai báo `@State` sẽ biến một thuộc tính thành một **nguồn sự thật chân lý**. Đảm bảo việc toàn vẹn dữ liệu là duy nhất cho View của nó. Lúc đó, nó được gọi tên là **The single source of truth**. Và ta cũng đã biết thì `@State` sẽ áp dụng có cách kiểu dữ liệu cơ bản và tham trị.

Với kiểu dữ liệu tham chiếu thì chúng ta sẽ sử dụng một Property Wrapper mới. Đó là `@StateObject`. Bạn xem qua ví nha:

```swift
struct MyMoviesView: View {
    @StateObject var movies = Movies()
    
    var body: some View {
        VStack {
            Text("My Movies")
                .italic()
                .bold()
                .font(.title)
            ForEach(movies.list) { movie in
                MovieView(movie: movie)
            }
        }.padding()
    }
}
```

Tương tự như với `@State`, `@StateObject` sẽ dùng để khai báo các thuộc tính với kiểu dữ liệu là tham chiếu và kiểu dữ liệu đó phải đảm bảo với **ObservableObject Protocol**. Lúc này, thuộc tính đó sẽ là một **nguồn sự thật chân lý**.

* Dữ liệu sẽ được lưu tại một nơi
* Các View sẽ ràng buộc nó để hiển thị giá trị
* Khi có sự thay đổi về giá trị thì các View sẽ tự động cập nhật

Ta xem qua thiết kế của class Movies là như thế nào:

```swift
class Movies: ObservableObject {
    @Published var list: [Movie]
    
    init() {
        list = Movie.myMovies()
    }
}
```

Vẫn phải đảm bảo về implement **ObservableObject Protocol** và các khai báo **@Published**. Còn lại các sử dụng như với **@State**.

### @ObservedObject

Sau khi, bạn đã có một **nguồn chân lý sự thật**. Tiếp theo, bạn cần tuyền dữ liệu hoặc ràng buộc với các View bên ngoài hay các View con của nó.

Tại ví dụ **MyMoviesView** bạn thấy là chúng ta có một danh sách với mỗi View con của List là **MovieView**. Đó là nơi chúng ta sẽ truyền một phần dữ liệu sang. Và cách sử dụng này cũng tương tự với `@Binding` cho các thuộc tính `@State`.

Ta sẽ có một Property Wrapper mới là `@ObservedObject`. Bạn cần phải nhớ rõ nha, vì 2 từ này dễ gây nhầm lẫn.

* **Observable** là nguồn phát dữ liệu
* **Observer** lắng nghe Observable

Bạn tham khảo ví dụ cho View **MovieView** như sau:

```swift
struct MovieView: View {
    @ObservedObject var movie: Movie
    
    var body: some View {
        HStack {
            Text(movie.name)
                .font(.body)
                .fontWeight(.bold)
            Spacer()
            Toggle(isOn: $movie.watched, label: {
                EmptyView()
            })
        }.padding()
    }
}
```

Chúng ta cũng vẫn sử dụng các tiền tố `$` để tạo một liên kết 2 chiều. Giúp cho việc cập nhật giá trị từ các UI Control.

Trong ví dụ ở trên nè:

```swift
Toggle(isOn: $movie.watched, label: { 
  //... 
}
```

Nó cũng tương tự như với @Binding. Bạn cũng không cần quá lo lắng. Hãy build lại project và cảm nhận.

## Tạm kết

* Việc cần thiết phải dùng các kiểu dữ liệu phức tạp
* Thiết kế class với ObservableObject Protocol
* Tuân thủ các nguyên tắc của The single source of truth

---

Cảm ơn bạn đã theo dõi các bài viết từ **Fx Studio** & hãy truy cập [website](https://fxstudio.dev/) để cập nhật nhiều hơn!

