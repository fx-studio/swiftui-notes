# 014.2 - User Interface State

Chào bạn đến với **Fx Studio**. Chúng ta lại tiếp tục với series **SwiftUI Notes** này. Chủ đề bài viết này là Trạng thái giao diện (**User Interface State**). Và thuộc phần về **State & Data Flow**.

## Chuẩn bị

Về mặt tool và version, các bạn tham khảo như sau:

- SwiftUI 2.0
- Xcode 12

Về mặt kiến thức, bạn cần biết trước các kiến thức cơ bản với SwiftUI & SwiftUI App. Tham khảo các bài viết sau, nếu bạn chưa đọc qua SwiftUI:

- [Làm quen với SwiftUI](https://fxstudio.dev/swiftui-phan-1-lam-quen-voi-swiftui/)
- [Cơ bản về ứng dụng SwiftUI App](https://fxstudio.dev/swiftui-phan-2-co-ban-ve-ung-dung-swiftui-app/)

*(Mặc định, mình xem như bạn đã biết về cách tạo project với SwiftUI & SwiftUI App rồi.)*

## State

Chúng ta đã có bài về về [Declaring Data](https://fxstudio.dev/declaring-data-swiftui-notes-12/) trong Swift. Trong đó, mình đã giới thiệu về **State** và cách sử dụng nó trong SwiftUI. Và nếu bạn là một theo dõi series này từ đầu thì cũng quen thuộc với **@State** rồi. Còn bây giờ, ta sẽ phân tích nó kĩ hơn một chút.

Với State, được xem là một trong những điều tuyệt với nhất của thế giới SwiftUI. Như bạn đã biết, các SwiftUI View đều là các `struct` và nó là `non-mutable` (không thể thay đổi). Bên cạnh đó, Views sẽ được tạo lại mỗi khi dữ liệu thay đổi. Nên các thuộc tính (dữ liệu) của View cũng phải được tạo lại.

Và với khai báo thuộc tính là Property Wrappers `@State` , bạn nói với SwiftUI rằng: bạn muốn nó giữ dữ liệu này trong một phần riêng của bộ nhớ. Cho phép nó được thay đổi và bảo toàn giá trị hiện tại trong quá trình làm mới chế độ xem.

![img_240](../_img/240.png)

Các biến/thuộc tính `@State` luôn là `value type` (kiểu tham trị) và thường sử dụng trong chính View. Nên khuyến cáo cho bạn khai báo `private` cho chúng nó. 

Bạn có thể truyền các giá trị (read-only) của `@State` cho các subview của. Nhưng chỉ sử dụng cho việc hiển thị mà thôi, còn với dữ liệu động (biến đổi) thì các subview sẽ không nhận được.

Ngoài ra, bạn có thể tạo các cầu nối 2 chiều (Binding) tới các thuộc tính `@State` từ các View khác. SwiftUI theo dõi các thay đổi trong dữ liệu và cập nhật mọi chế độ xem bị ảnh hưởng nếu cần.

## Manage Mutable Values as State

Chúng ta sẽ tìm hiểu tiếp cách hoạt động của State với việc quản lý các trạng thái giá trị như thế nào. Bắt đầu, nếu SwiftUI View của bạn cần một `store data` có thể thay đổi được giá trị. Cách tốt nhất là hãy khai báo nó với `@State` property wrapper.

> Ngoài cách này, bạn có thể sử dụng trực tiếp việc khai báo đối tượng từ **Struct State**. Nhưng mà thôi, biết vậy là được rồi.

Ta có ví dụ như sau:

```swift
struct PlayerView: View {
    @State private var isPlaying: Bool = false
    
    var body: some View {
        // ...
    }
}
```

Ta khai báo thuộc tính `isPlaying` cho **PlayerView**, để biết trạng thái của View là đang chơi nhạc hay dừng lại. Ta sẽ xem tiếp cách sử dụng thuộc tính đó như thế nào trong View nha.

```swift
Button(action: {
    self.isPlaying.toggle()
}) {
    Image(systemName: isPlaying ? "pause.circle" : "play.circle")
}
```

Trong đó:

* Nếu bạn chỉ muốn hiển thị dữ liệu từ thuộc tính. Thì cần truy cập vào `wrappedValue` của thuộc tính **State**.
* Dự vào nội dung của giá trị thuộc tính mà View sẽ có hiển thị phù hợp. Trong ví du là sự thay đổi giữa 2 hình "*play*" hay "*pause*".
* Nếu bạn muốn thay đổi giá trị của thuộc tính **State**. Thì sử dụng như bao biến/thuộc tính bình thường trước đây.

> Khi bạn thay đổi giá trị, SwiftUI cập nhật các phần bị ảnh hưởng của chế độ xem.

Cuối cùng, giới hạn phạm vi của các biến trạng thái (State) bằng cách khai báo chúng là riêng tư (private). Điều này đảm bảo rằng các biến vẫn được đóng gói trong cấu trúc phân cấp View mà chúng khai báo.

Kết quả đạt được là chúng ta có thể biểu diễn trạng thái của View đồng bộ với trạng thái của dữ liệu. Tất cả, thông qua việc sử dụng các thuộc tính **State**.

## Store Properties Immutable Values

Đôi khi chúng ta vẫn sử dụng các thuộc tính mà chúng không thay đổi giá trị. Tức là SwiftUI View chỉ hiển thị mà thôi và không cần tạo lại. Như vậy, bạn hãy khai báo các thuộc tính như bình thường. Đơn giản vậy thôi.

Ta sẽ làm một ví dụ đơn giản nhoé.

```swift
struct PlayerView: View {
    let episode: Episode // The queued episode.
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            // Display information about the episode.
            Text(episode.title)
            Text(episode.showTitle)

            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            }
        }
    }
}
```

Trong đó:

* `episode` chứa thông tin hiển thị

Nó sẽ không thay đổi giá trị được. Cho dù thuộc tính State thay đổi bao nhiêu lần đi nữa và SwiftUI View có tạo mới lại nhiều lần đi nữa. Thì giá trị của nó là bât biến và bạn không thể làm được gì. Hoặc bạn cố khai báo với `var` thì hầu như cũng là bất lực mà thôi

## Share Access to State with Bindings

Ta đã đi qua 2 phần với 2 kiểu trạng thái của giao diện (thay đổi được và không thay đổi được). Tiếp theo, ta sẽ tìm hiểu một đặc tính nữa của các biến/thuộc tính State.

Khi View của bạn có các **subview** (view con) và bạn muốn kiểm soát các thuộc tính của **subview**. Hoặc muốn chia sẽ việc truy cập tới `store data` (chính là biến State). Thì hãy khai báo các thuộc tính của **subview** với Property Wrappers `@Binding`.

Một **Binding** đại diện cho một tham chiếu đến bộ nhớ hiện có, duy trì một **nguồn sự thật chân lý** cho dữ liệu (*với kiểu dữ liệu cơ bản, như: Int, Float ...*).

### Define

Bạn thử nâng cấp ví dụ ở trên với việc tạo ra một SwiftUI View riêng cho Button nha. Tham khảo code như sau:

```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}
```

Tại **PlayButton**, ta khai báo `isPlaying` với kiểu là `@Binding`. Bạn sẽ nhận ra một điều rất `sướng` của SwiftUI.

> Bạn không cần cấp giá trị ban đầu cho nó và cũng không cần thêm hàm khởi tạo nữa.

### Binding

Các dữ liệu của Binding sẽ được cung cấp từ bên ngoài. Và để xem việc truyền dữ liệu từ bên ngoài vào như thế nào. Bạn xem tiếp ví dụ code sau cho **PlayerView**.

```swift
struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
    }
}
```

Trong đó, bạn chỉ cần chú ý tới dòng code truyền dữ liệu từ **PlayerView** cho **PlayButton** mà thôi. Với khai báo kèm theo tiền tố `$`, bạn tạo nên một sự ràng buộc với `projectedValue` của thuộc tính **State**. Sự kết nối này sẽ trỏ tới vùng nhớ của thuộc tính đó. Do đó, các subview có thể truy cập và lấy được giá trị của **State**. Có thể truyền qua nhiều subview với nhau.

### Binding to a scoped value

Khi bạn có cả một đối tượng và bạn vẫn có thể chỉ cần Binding một phần dữ liệu của đối tượng đó thì thuộc tính `@State` sẽ cần được hết.

> Theo nguyên tắc trên thì `@State` chỉ áp dụng các kiểu *(type value)* dữ liệu cơ bản mà thôi. Ví dụ: *Int, Float, String ...*

Nên khi khai báo một thuộc tính **State** với kiểu dữ liệu phức tạp (Struct), thì ta sẽ áp dụng việc Binding được cho thuộc tính riêng lẻ của đối tượng mà thôi. Còn toàn bộ đối tượng thì không được.

Bạn xem qua ví dụ nha:

```swift
struct Podcaster: View {
    @State private var episode = Episode(title: "Some Episode",
                                         showTitle: "Great Show",
                                         isFavorite: false)
    var body: some View {
        VStack {
            Toggle("Favorite", isOn: $episode.isFavorite) // Bind to the Boolean.
            PlayerView(episode: episode)
        }
    }
}
```

Bạn có một **Podcaster** là một *SwiftUI View* lớn nhất, nó chứa **PlayerView**. Trong đó:

* `episode` là một kiểu Struct và được khai báo theo `@State`
* Sử dụng thuộc tính `.isFavorite` để thay đổi một giá trị thuộc tính của **State** `episode`



Qua phần này, bạn đã có đầy đủ vũ khí với State và Binding rồi. Hãy sử dụng một cách khôn ngoan nha. Thành bại đều tuỳ thuộc vào cách suy nghĩ của bạn mà thôi.

## Animate State Transitions

Khi bạn thay đổi giá trị của thuộc tính State thì hầu như các View sẽ ngay lập tức thay đổi hiển thị. Nến bạn muốn các hiệu ứng mượt mà hơn khi các trạng thái thay đổi giá trị. SwiftUI cung cấp cho bạn một function `withAnimation(_:_:) ` . Nó hoạt động như một trigger, trong quá trình diễn ra hiệu ứng thì dữ liệu của bạn sẽ được biến đổi theo.

Ta hãy lấy ví dụ cho Button của chúng ta. Bạn xem qua code ví dụ như sau tại **PlayButton**.

```swift
        Button(action: {
            withAnimation(.easeInOut(duration: 1)) {
                self.isPlaying.toggle()
            }
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .scaleEffect(isPlaying ? 1 : 1.5)
        }
```

Trong đó:

* Thay đổi trạng thái của `isPlaying` được sử dụng với `withAnimation`
* Sự thay đổi này kèm theo hiệu ứng cho Image với `.scaleEffect(isPlaying ? 1 : 1.5)`
* Bạn sẽ yên tâm là button của chúng ta sẽ phóng to và thu nhỏ liên tục với nhau

Và một điều mà bạn sẽ phải biết là Image chỉ thay đổi được kích thước dựa theo hiệu ứng. Còn nội dung ảnh của nó hoàn toàn không thể có sự biết đổi đó áp dụng vào được.

Ta sẽ có thêm một ví dụ nữa để chứng tỏ việc thay đổi dữ liệu sẽ ảnh hưởng qua nhiều View với nhau. Tham khảo thêm code này ở **PlayerView**.

```swift
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
        .background(isPlaying ? Color.green : Color.red) // Transitions with animation.
```

Chúng ta sẽ thay đổi hiểu thị cho toàn bộ một View với hiệu ứng từ việc thay đổi giá trị của một thuộc tính State. Nhưng vị trí diễn ra sự thay đổi đó lại ở một nơi khác.

Bạn hãy build lại project và cảm nhận kết quả nha!

## Tạm kết

* Phân tích **State** trong việc ảnh hưởng tới trạng thái của giao diện
* Các kiểu thuộc tính tác động tới giao diện
* Chia sẽ tới các **State** bằng các **Binding**
* Các cách **Binding** cơ bản
* Hiệu ứng cho việc thay đổi giá trị của các **State**

---

Cảm ơn bạn đã theo dõi các bài viết từ **Fx Studio** & hãy truy cập [website](https://fxstudio.dev/) để cập nhật nhiều hơn!
