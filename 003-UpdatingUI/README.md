# 003 : Updating the UI

Bài viết này sẽ hướng dẫn nhanh cho bạn tương tác với giao diện. Chúng ta sẽ dùng lại giao diện ở bài **Creating UI**, nên nếu bạn nào chưa đọc thì có thể tìm lại đọc thêm. Còn nếu đã ổn rồi thì ...

> Bắt đầu thôi!

## Chuẩn bị

Để tiết kiệm thời gian thì bạn có thể xem lại code của **ContentView** như sau:

```swift
struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                print("^")
            }) {
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
                    .foregroundColor(.red)
            }
            .frame(width: 50.0, height: 50.0)
            Text("0")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.center)
            Button(action: {
                print("v")
            }) {
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
            }
            .frame(width: 50.0, height: 50.0)
        }
        .frame(width: 50.0, height: 200.0)
            
    }
}
```

Với SwiftUI thì bạn có thể thoải mái copy và bỏ vào một project SwiftUI khác. Mọi thứ đều là view nên rất là linh hoạt.

## 1. Hiển thị dữ liệu

Mặc dù là SwiftUI khác nhiều so với UIKit. Nhưng chúng nó đều phải có những nhiệm vụ chung cần phải được giải quyết. Nó thuộc về phạm trù bản chất của lập trình mobile rồi.

Bắt đầu, chính là nhiệm vụ hiển thị dữ liệu lên giao diện. Bạn cũng biết là không thể nào `hard code` hết tất cả. Chúng ta sẽ tạo biến lưu trữ dữ liệu. Và đưa giá trị đó lên view của SwiftUI.

Bạn thêm khai báo sau vào **ContentView** trên.

```swift
var number: Int = 10
```

Mục tiêu chính là đem giá trị của `number` vào Text. Bạn chỉnh sửa lại một chút như sau:

```swift
Text("\(number)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.center)
```

Bạn sẽ thấy biến `number` được gián vào String làm đối số ban đầu cho việc khởi tạo Text. Và chưa đây 1 phút thì giao diện của bạn cập nhật lại. Nếu chờ lâu thì bạn hãy bấm `resume` hoặc `try again` nha.

## 2. Sự kiện

Nhiệm vụ thứ 2 của View cần đảm nhận, đó là nhận sự kiện từ người dùng. Trong giao diện đơn giản trên thì ta có 2 Button. Chúng nó sẽ nhận nhiệm vụ đón nhận sự kiện người dùng. Bạn xem lại code của Button.

```swift
Button(action: {
                        // code here
                    }) {
                        Image(systemName: "arrowtriangle.up.fill")
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                            .foregroundColor(.red)
                    }
```

Trong đó, `action` là tham số với yêu cầu là 1 closure. Mọi thứ bạn cần phải làm vào đó mà quẩy. Bạn hãy thử tăng `number` lên 1 đơn vị với code như sau:

```swift
Button(action: {
                        number += 1
                    }) {
                        Image(systemName: "arrowtriangle.up.fill")
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                            .foregroundColor(.red)
                    }
```

Điều bạn nhận được sẽ là:

> Left side of mutating operator isn't mutable: 'self' is immutable

Căng nhĩ!

## 3. Cập nhật dữ liệu

Tiếp theo, chúng ta sẽ giải quyết lỗi ở trên. Bạn cũng biết nguyên nhân chính là từ khai báo ban đầu của **ContentView**. 

```swift
struct ContentView: View { }
```

Nó là `struct` chứ không phải là `class`. Nên việc thay đổi giá trị của thuộc tính là không thể được. Để khắc phục điều này thì SwiftUI đã cho ta 1 keyword. Nó là

> `@State`

Ta chỉnh sửa lại khai báo `number` như sau:

```swift
@State var number: Int = 10
```

Ta sẽ thêm từ khoá **@State** trước khi khai báo. Điều này đồng nghĩa ta sẽ uỷ thác cho SwiftUI lưu trữ giá trị biến đó trong bộ nhớ chừng nào View còn tồn tại. Và khi State có sự thay đổi, SwiftUI sẽ tự động hiểu để cập nhật lại View tương ứng với trạng thái mới nhất của dữ liệu.

> Về **@State** thì sẽ có một bài viết riêng về nó.

Và cũng chưa đây 1 phút thì SwiftUI đã cập nhật. Bạn hãy bấm vào **Live Preview**, sau đó nhấn vào **Button** để cảm nhận kết quả có sự thay đổi hay không.

Bạn tiếp tục cập nhật thêm cho Button giảm giá trị. Code cuối cùng sẽ trông như thế này.

```swift
struct ContentView: View {
    
    @State var number: Int = 10
    
    var body: some View {
        VStack(alignment: .center) {
                    Button(action: {
                        number += 1
                    }) {
                        Image(systemName: "arrowtriangle.up.fill")
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                            .foregroundColor(.red)
                    }
                    .frame(width: 50.0, height: 50.0)
                    Text("\(number)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        number -= 1
                    }) {
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                    }
                    .frame(width: 50.0, height: 50.0)
                }
                .frame(width: 50.0, height: 200.0)
    }
}
```



## Tạm kết

Bạn sẽ nhận ra sự khác nhau cơ bản của giữa SwiftUI & UIKit trong vấn đề cập nhật dữ liệu lên giao diện.

* Với UIKit sau khi thay đổi giá trị của thuộc tính, thì bạn phải cập nhật lại giá trị thuộc tính của View trong giao diện. Bạn cần 2 bước.
* Với SwiftUI, mọi thứ sẽ được tự động. Bạn chỉ cần thay đổi giá trị của thuộc tính. Và giao diện sẽ tự động `render` lại với giá trị mới đó. Bạn cần 1 bước thôi.

---

Okay! tới đây thì mình xin kết thúc bài viết ngắn này. Tuy bài viết chỉ đề cập tới 1 chủ để đơn giản, nhưng nó là một trong những điểm quan trọng để thay đổi tư duy từ UIKit sang SwiftUI. Hẹn gặp lại bạn ở các bài viết sau.

Cảm ơn bạn đã đọc bài viết này!