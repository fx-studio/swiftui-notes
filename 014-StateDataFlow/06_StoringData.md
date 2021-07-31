# 014.6 - Storing Data

Chào mừng bạn đến với **Fx Studio**. Chúng ta lại tiếp tục hành trình bất tận series **SwiftUI Notes** này. Chủ đề bài viết hôm nay thì khá đơn giản, đó là **Storing Data** trong *SwiftUI*. À, chỉ là cơ bản thôi nha, mục đích lưu trữ các dữ liệu đơn giản và bé.

Nếu mọi việc đã ổn rồi, thì ...

> Bắt đầu thôi!

Về mặt tool và version, các bạn tham khảo như sau:

- SwiftUI 2.0
- Xcode 12

Về mặt kiến thức, bạn cần biết trước các kiến thức cơ bản với SwiftUI & SwiftUI App. Tham khảo các bài viết sau, nếu bạn chưa đọc qua SwiftUI:

- [Làm quen với SwiftUI](https://fxstudio.dev/swiftui-phan-1-lam-quen-voi-swiftui/)
- [Cơ bản về ứng dụng SwiftUI App](https://fxstudio.dev/swiftui-phan-2-co-ban-ve-ung-dung-swiftui-app/)

*(Mặc định, mình xem như bạn đã biết về cách tạo project với SwiftUI & SwiftUI App rồi.)*

Về mặt lưu trữ dữ liệu, bài viết này chỉ đề cập về phạm vi lưu trữ khá là cơ bản. Bao gồm các biến và các đối tượng sử dụng trong quá trình hoạt động của ứng dụng.

## Storing temporary data

Đọc qua tên thì nghe rất sang miệng, tuy nhiên chúng ta đã sử dụng nó rất nhiều rồi. Đó chính là **The single source of truth**. Đó là cái bạn dùng lâu nay khi làm việc với SwiftUI.

### Local View

Khi bạn tạo một thuộc tính trong một View với khai báo là `@State`, đây là một Property Wrapper đơn giản nhất. Nó giúp bạn tạo ra một phần bộ nhớ, với giá trị lưu trữ chính là giá trị của thuộc tính. Tuy nhiên, nó chỉ có lưu trữ được các giá trị cơ bản mà thôi. Như: Int, Float, String ... và một phần cấu trúc Struct.

> Khi đối tượng View bị giải phóng đi, thì bộ nhớ này cũng giải phóng theo. Nó mang tính chất tạm thời mà thôi.

Đối với kiểu dữ liệu phức tạp hơn và tham chiếu, chúng ta lại có các thuộc tính với khai báo là `@StateObject`. Cũng là một Property Wrapper. Các tính chất nó sẽ tương tự với State.

> Cả 2 thế lực này sẽ hình thành nên cái gọi là **The single source of truth**.

Lưu ý: nên sử dụng `private` khi khai báo thuộc tính mà chỉ sử dụng trong View mà thôi.

Ví dụ tham khảo:

```swift
struct PlayerView: View {
    @State private var isPlaying: Bool = false
    
    var body: some View {
      // ....
    }
}
```

### View hierarchy

Khi bạn đã ổn định với dữ liệu lưu trữ tại các View với `@State` & `@StateObject`. Thì đối với phân cấp view của nó (hay các view con của nó), dữ liệu được lưu trữ vẫn có tác dụng lớn. 

Bạn không cần phải suy nghĩ việc cập nhật dữ liệu hay truyền tải dữ liệu từ View cha sang View con nữa. Lúc này, chúng ta lại dùng các Property Wrappers sau:

* `@Binding` cho các thuộc tính khai báo với `@State`
* `@ObservedObject` cho các thuộc tính khai báo `@State`

Cả 2 đều tạo là kết nối hai chiều. Giúp cho việc xử lý và cập nhật dữ liệu tập trung về một điểm. Tránh được nhiều lỗi phát sinh ra với dữ liệu. Sự ảnh hưởng khi dữ liệu thay đổi sẽ được cập nhật cho toàn bộ các View mà có sự ràng buộc tới.

Điểm lợi ích của kiểu dùng này:

* Không cần phải khởi tạo với các thuộc tính này
* Không cần gán giá trị ban đầu cho chúng

Ví dụ tham khảo

```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 1)) {
                self.isPlaying.toggle()
            }
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .scaleEffect(isPlaying ? 1 : 1.5)
        }
    }
}
```

### Sharing

Khi bạn muốn truyền 1 đối tượng đi qua các view trong một phân cấu View thì hãy sử dụng tới `@EnvironmentObject`. Đây cũng là một Property Wrapper hữu ích nữa.

Thuộc tính này tạo nên sự riêng biệt và tự động kết nỗi giữa các View với nhau. Bạn chỉ cần tạo ra một đối tượng và dùng nó truyền đi xuyên suốt cả 1 phân cấp view. Mọi thay đổi để sẽ được tự động cập nhật hết.

Nếu bạn kết hợp với các `@State` & `@StateObject` thì như hổ thêm cánh.

```swift
struct View7: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.captionBackgroundColor) var backgroundColor
    
    var body: some View {
        if colorScheme == .light {
            Text("Light mode")
                .background(backgroundColor)
        } else {
            Text("Dark mode")
                .colorScheme(.light)
                .background(backgroundColor)
        }
    }
}
```

### Root

Nếu bạn muốn 1 thứ dữ liệu tạm thời, lưu trữ trong toàn bộ ứng dụng. Thì hãy khai báo nó ở Root hay là ở Window. Sau đó, bạn có thể sử dụng một trong 2 cách sau:

* The single source of truth
* Environment

Lúc này, dữ liệu luôn được giữ tại một nơi. Mọi cập nhật thay đổi từ các View khác đều ảnh hưởng về lại Root. Và từ đó, bạn sẽ lan toả năng lượng tích cực ra.

```swift
@main
struct DemoStateDataFlowApp: App {
    
    var body: some Scene {
        WindowGroup {
            var userProfile = UserProfile(name: "Fx", email: "admin@fxstudio.com", age: 20, gender: true)
            
            View6()
                .environmentObject(userProfile)
                .environmentObject(Settings())
        }
    }
}
```

## Storing long-term data

Với các loại lưu trữ trên thì khi bạn `kill app` hay khởi động lại app thì sẽ mất sạch dữ liệu được lưu trữ. Sau đây, chúng ta sẽ tìm hiểu các cách lưu trữ dữ liệu lâu dài với SwiftUI.

> Vẫn là cách áp dụng cho các kiểu dữ liệu đơn giản và cơ bản (như: Int, Float ...) mà thôi.

Với các kiểu dữ liệu phức tạp hay cần lưu trữ số lượng lớn thì đây không phải là lựa chọn tốt. Bạn sẽ tìm hiểu về Database cho SwiftUI sau nhoé.

### UserDefault

Đây chính là cái đầu tiên bạn có thể nghĩ ra trong đầu. UserDefault được xem một trong những huyền thoại của iOS. Tất nhiên, với SwiftUI thì nó vẫn đóng góp một vai trò nhất định khi bạn cần lưu trữ những giá trị nhỏ.

#### Ví dụ sử dụng đơn giản

```swift
struct View8: View {
    
    @State var isOkay: Bool
    
    init() {
        isOkay = UserDefaults.standard.bool(forKey: "ahihi")
    }
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOkay, label: {
                Text("Ahihi!")
            })
            .padding()
            Button(action: {
                UserDefaults.standard.setValue(!isOkay, forKey: "ahihi")
                isOkay = UserDefaults.standard.bool(forKey: "ahihi")
            }, label: {
                Text("Change")
            })
        }
    }
}
```

Trong đó:

* Bạn cần lấy được giá trị cho biến `isOkay` từ UserDefaults (như bình thường)
* Khi Toggle thay đổi giá trị của State, nhưng nếu ta không cập nhật lại UserDefault thì lần sau khởi động lại ứng dụng thì dữ liệu sẽ không được cập nhật.
* Còn nếu thay đổi giá trị ở Button khi người dùng nhấn vào. Nếu không cập nhật dữ liệu lại biến State thì giao diện cũng không thay đổi.

Đây chính là bất cập mà UserDefault đang tồn tại trong SwiftUI. Đó chính là Binding. Và khi ta khắc phục bằng đồng bộ code như vậy thì chúng ta đã đi xa nguyên tắc của Declarative Programming rồi.

#### Observation hoá UserDefault

Trong cái khó nó ló cái khôn bạn à. Chúng ta vẫn có cách để cho UserDefaults có thể có Binding như các **The single source of truth** kia.

Bắt đầu, bạn cần tạo một Property Wrapper để bọc UserDefaults lại. Cách này bạn sẽ sử dụng khá là ổn, tránh việc code dài dòng phức tạp. Bạn hãy tham khảo ví dụ code sau:

```swift
@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
```

Tiếp theo, bạn cần tạo một ObservableObject class. Cái có thể giúp bạn kết nối với SwiftUI View và Binding dữ liệu. Tham khảo code sau:

```swift
final class UserSettings: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault("ShowOnStart", defaultValue: true)
    var showOnStart: Bool {
        willSet {
            objectWillChange.send()
        }
    }
}
```

Trong đó:

* Sử dụng một thuộc tính từ Property Wrapper ở trên. Key của UserDefault thì bạn hãy tự cung cấp, kèm theo giá trị mặc định ban đầu.
* Sử dụng một Subject để thông báo sự thay đổi của giá trị của thuộc tính `@UserDefault` kia

Bạn chú ý `import combine` nhoé. Tuy nhiên, chúng hoạt động hơi lag một tý. Đôi khi sẽ không đồng bộ kịp thời.

Tóm lại, UserDefault oke đó, nhưng vẫn có nhiều hạn chế chưa thể giải quyết được. Vẫn tồn tại ý thức hệ của phong cách lập trình trước đây cho iOS.

### AppStorage

Một giải pháp thay thế được SwiftUI đưa ra cho UserDefaults. Đó là Property Wrapper `@AppStorage`. Đặc tính của nó như sau:

* Tự động lưu trữ lại giá trị, bạn không cần phải xét lại giá trị như UserDefaults
* Có thể kết nối với SwiftUI View
* Các UI khi ràng buộc với nó thì vẫn có thể tự động cập nhật khi giá trị có sự thay đổi.
* Ảnh hưởng cho toàn bộ ứng dụng, không phụ thuộc vào đối tượng nào hết.

Bạn xem qua ví dụ nha.

```swift
struct View9: View {
    @AppStorage("count") var count: Int = 0

        var body: some View {
            VStack {
                Text("\(count)")

                Button("Tappe!") {
                    count += 1
                }
            }
        }
}
```

Ví dụ cực kì đơn giản lại. `@AppStorage` tương tự như `@State`. Nhưng bạn được thêm tính năng lưu trữ lại dữ liệu lại trong ứng dụng. Và khi khôi phục lại dữ liệu thì mọi thứ sẽ phục hồi đúng với giá trị cuối cùng nó được lưu trữ.

Với việc khai báo `@AppStorage` thì như sau:

```swift
@AppStorage("username") var username: String = "Anonymous"
```

Tương ứng với việc bạn sử dụng `UserDefaults.standard.string(forkey:_)` và nếu chưa có đối tượng thì nó sẽ lấy giá trị ban đầu được gán vào.

Hoặc khi bạn lựa chọn một store khác `standard` thì như sau:

```swift
@AppStorage("username", store: UserDefaults(suiteName: "com.fx.ahihi")) var username: String = "Anonymous"

```

Nhưng mà thôi đừng quan tâm nha bạn, phức tạp thêm. Sống đơn giản cho đời thanh thản. Hãy build và cảm nhận kết quả nha.

### SceneStorage

Đây cũng là một Property Wrapper mới được SwiftUI cung cấp trong Xcode 13. Rất là mới. 

Về ý nghĩa thì `@ScenceStorage` cũng tương tự như `@AppStorage`. Khi cho phép lưu trữ và phụ hồi lại dữ liệu. Tuy nhiên, chúng chỉ có ý nghĩa trong ngữ nghĩa Scene đó mà thôi. Các view cùng một sence sẽ nhận được cùng giá trị với nhau.

Có một điểm nữa là khi bạn `kill app` hay khởi động lại app thì các dữ liệu đó sẽ bị mất đó. Do đó, nó có ý nghĩa trong việc cài đặt các giá trị mặc định cho 1 Scene hay 1 luồng View. Chúng sẽ quay về như ban đầu khi bạn khởi động lại.

> Vì mới ra ở Xcode 13 nên chưa có nhiều ví dụ cụ thể về nó.

Bạn có thể xem qua ví dụ sau:

```swift
struct View10: View {
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            View10A().tag(0)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            View10B().tag(1)
                .tabItem {
                    Label("Menu", systemImage: "square.and.pencil")
                }
        }
    }
}

struct View10A: View {
    
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        VStack {
            Text("selectedTab = \(selection)")
            Button {
                selection = 1
            } label: {
                Text("change")
            }

        }
    }
}

struct View10B: View {
    
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        VStack {
            Text("selectedTab = \(selection)")
            Button {
                selection = 0
            } label: {
                Text("change")
            }

        }
    }
}
```

Trong đó:

* 1 Tabbar chứa 2 Tab là 2 View `View10A` & `View10B`
* Bạn có thể thay đổi dữ liệu Tabbar ngay cả ở View con. Hay bạn có thể đổi Tab bằng cách xét lại `selection`
* Rất hay khi bạn điều kiển các luồng từ một luồng khác, không cần call back hay sử dụng các delegate.

Build lại project và cảm nhận kết quả nhoé!

## Tạm kết

* Phân loại các bộ nhớ trong SwiftUI
* Các thành phần cấu tạo nên Storing temporary data và sự phân chia vùng ảnh hưởng
* Các vấn đề với Storing long-term data và các đối tượng lưu trữ dữ liệu

---

Cảm ơn bạn đã theo dõi các bài viết từ **Fx Studio** & hãy truy cập [website](https://fxstudio.dev/) để cập nhật nhiều hơn!
