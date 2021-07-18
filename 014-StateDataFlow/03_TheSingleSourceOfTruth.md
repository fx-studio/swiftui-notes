# 014.3 - The single source of truth

Chào bạn đến với **Fx Studio**. Chúng ta lại tiếp trục hành trình trong series **SwiftUI Notes**. Chủ đề hôm nay là "**The single source of truth**". Mình sẽ tạm gọi nó bằng cái tên thân quen là "**nguồn sự thật chân lý**". Đây cũng là một khái niệm mà bạn đã và sẽ gặp rất nhiều khi phiêu lưu cùng SwiftUI.

Nếu mọi thứ ổn rồi, thì ...

> Bắt đầu thôi!

## Chuẩn bị

Về mặt tool và version, các bạn tham khảo như sau:

- SwiftUI 2.0
- Xcode 12

Về mặt kiến thức, bạn cần biết trước các kiến thức cơ bản với SwiftUI & SwiftUI App. Tham khảo các bài viết sau, nếu bạn chưa đọc qua SwiftUI:

- [Làm quen với SwiftUI](https://fxstudio.dev/swiftui-phan-1-lam-quen-voi-swiftui/)
- [Cơ bản về ứng dụng SwiftUI App](https://fxstudio.dev/swiftui-phan-2-co-ban-ve-ung-dung-swiftui-app/)

*(Mặc định, mình xem như bạn đã biết về cách tạo project với SwiftUI & SwiftUI App rồi.)*

## Giao diện là khó

Trước tiên, chúng ta sẽ đi qua những vấn đề dẫn tới sự cần thiết của một giải pháp cho giao diện và trạng thái dữ liệu.   Như bạn biết hoặc có thể bạn chưa nghe tới, thì chúng ta đang có 2 trường phái làm mưa làm gió trong giới lập trình. Đó là:

> Declarative vs Imperative

Hay gọi là lập trình khai báo (Declarative) và lập trình mệnh lệnh (Imperative). Và đó cũng là 2 cách tiếp cận để giải quyết các bài toán của chúng ta.

*(Mình sẽ không phân tích hay định nghĩa 2 trường phái lập trình này.)*

### Giao diện không phải ánh đúng trạng thái dữ liệu

Vấn đề này thì cũng đã đề cập nhiều ở các bài viết trước rồi. Bạn có thể đọc thêm về nó sau. Về bài viết này, mình sẽ lại phần tích và đưa ra ví dụ cho bạn thấy sự khác nhau của 2 cách tiếp cận để bạn thực hiện xử lý và hiển thị.

Ví dụ, bạn có một màn hình và một danh sách. Bài toán của bạn là sẽ sắp xếp danh sách theo 3 tiêu chí: thời gian, thứ tự chữ cái và ngẫu nhiên.

**Với cách tiếp cận Declarative** là lưu các trạng thái cho biết một trong 3 cách mà chúng ta thực hiện việc sắp xếp danh sách đó. Sau đó, View sẽ lấy cả 2 (danh sách & trạng thái sắp xếp) và hiển thị danh sách đúng như cách người dùng chỉ định. Việc của người dùng đơn giản chỉ là, kích vào button hiển trị trạng thái sắp xếp và chọn cách sắp xếp. Ngay lập tức toàn bộ chương trình sẽ phản ứng lại với việc thay đổi trạng thái từ hành động người dùng. Và `bùm`, mọi thứ hoạt động nhanh chóng.

**Với cách tiếp cận Imperative** thì ngược lại rất nhiều. Khi người dùng nhấn vào button và chọn cách sắp xếp. Ngay tại đó, tại function bắt sự kiện của button. Bạn sẽ kiểm tra là chọn cách sắp xếp nào, tiếp theo bạn mới gọi tiếp function thực hiện sắp xếp. Có thể việc thực hiện sắp xếp là đồng bộ hay có thể bất đồng bộ ... thì bạn cần thực hiện tiếp việc cập nhật lại giao diện. Ở đây, bạn có 2 nơi cần cập nhật (Button & List). Và nếu như bạn có nhiều hơn 1 button thực hiện việc sắp xếp thì số lần bạn thực hiện các mệnh lệnh này sẽ nhiều thêm. Bạn cũng phải đảm bảo việc cập nhật giao diện ở nhiều nơi.

### Thứ tự tương tác

Cùng một dữ liệu những khi phản ứng với một hành động của người dùng thì với các tiếp cận **Imperative** bạn sẽ gặp vấn đề về thứ tự tương tác dữ liệu.

Ví dụ, button A gọi thực thi 3 function là `hamA` , `hamB` và `hamC`. Khi người dùng nhấn vào button bạn sẽ có tổ hợp thứ tự gọi của 3 function đó. Ví dụ như:

> `A B C` , `A C B`, `B A C`, `B C A`, `C A B`, `C B A`

Tổ hợp này sẽ nhiều lên với số lượng các function cần thực thi trong một hành động. Hệ quả kém theo đó, bạn sẽ thấy giao diện của bạn sẽ phản ứng khác nhau đối với từng thứ tự gọi.

Còn với cách tiếp cận **Declarative** thì mọi việc lại đơn giản và chân phương hơn nhiều. Bạn chỉ cần thực hiện việc biến đổi dữ liệu thôi. Các giao diện đã được khai báo ứng với từng trạng thái dữ liệu rồi thì sẽ có cách hiển thị phù hợp.

Phần này, không phải nói lên việc tối ưu của *Declarative*. Vì nếu bạn là một coder có tâm, cần thận trong mọi tình huống thì sẽ không bao giờ mắc những lỗi do việc đặt sai thứ tự câu lệnh. Qua đó, bạn sẽ thấy rằng việc xử lý ...

> Giao diện là **khó**.

## Sự tương đồng trong việc truyền tải dữ liệu tham chiếu & tham trị

Ở trên, ta đã biết việc quản lý giao diện hiển thị đúng với trạng thái dữ liệu thì không phải là công việc đơn giản rồi. Trong phần này, mình sẽ đi sơ qua việc bạn có thể bị lỗi cho cả 2 kiểu dữ liệu mà bạn dùng.

Như đã biết, chúng ta lại có 2 kiểu dữ liệu đặc trưng nhất, đó là

* Tham chiếu (reference type)
* Tham trị (value type)

Cũng vì bản chất của chúng nó mà dẫn tới việc không toàn vẹn dữ liệu hoặc dị bản. Từ đó, giao diện chúng ta sẽ hiển thị không chính xác.

**Với tham trị** khi bạn truyền dữ liệu đi & bạn thay đổi chúng. Lúc này, bạn không phải thay đổi trực tiếp lên chúng nó. Mà là bạn thực hiện việc nhân bản (copy) chúng và thay đổi bản copy đó. Sự thay đổi này được giới hạn ở bản sao dữ liệu. Bản gốc không bị ảnh hưởng. Kết thúc quán trình này, bạn phải cập nhật lại bản gốc. Nhằm đảm bảo cho tính đồng bộ.

**Với tham chiếu**, mỗi lần truyền dữ liệu đi, bạn chuyển đi một tham chiếu. Mọi sự thay đổi về dữ liệu đều được nhìn thấy ở bất kì đâu tham chiếu đến. Và bất kì ai cũng có thể thực hiện thay đổi dữ liệu. Điều này lại dẫn tới việc dữ liệu sẽ không an toàn. Hoặc bạn có thể bị mất đi dữ liệu, khi các tham chiếu không được quản lý tốt.

Vâng vâng và mây mây ... kể cả 2 kiểu dữ liệu đặc trưng đó đều chứa chấp các nguy cơ tiềm năng về mặt dữ liệu & đồng bộ. Ta phải cần một giải pháp dung hoà cho:

* Tham trị có thể như tham chiếu
* Tham chiếu thì lưu trữ tốt như tham trị

> Và đó là câu chuyện dẫn tới **Nguồn sự thật chân lý** của chúng ta.

## "The single source of truth" là gì?

Nhiều bạn dev iOS có thế ngộ nhận là đây là của Apple đưa ra. Tuy nhiên, về lý thuyết của **The single source of truth** thì đã tồn tại rất lâu và áp dụng vào trong nhiều ngành nghề, hay các hệ thống khác rồi. Ta xem qua định nghĩa trên Wikipedia như sau:

> In information systems design and theory, **single source of truth** (*SSOT*) is the practice of structuring information models and associated data schema such that every data element is mastered (or edited) in only one place. Any possible linkages to this data element (possibly in other areas of the relational schema or even in distant federated databases) are by reference only.

### Khái niệm

Với SwiftUI thì nói rằng:

> Khái niệm **The single source of truth**, thì họ nói rằng bạn có quyền quyết định một nơi duy nhất để lưu trữ một dữ liệu. Và các nơi khác hay bất kỳ đâu ... thì có thể đọc được phần dữ liệu đó. Do đó, nguồn dữ liệu này là duy nhất.

Diễn giải thêm ý,

* Dữ liệu chỉ nên được sở hữu bởi một thực thể duy nhất.
* Mọi thực thể khác phải truy cập vào cùng một dữ liệu đó, không phải là một bản sao của nó.

Và cuối cùng, qua hành vi của việc truyền tải dữ liệu đi cho cả 2 kiểu dữ liệu đặc trưng. Thì trong SwiftUI, bạn có thể suy nghĩ **The single source of truth** mang hành vi của một kiểu tham chiếu.

### Giao diện

Khi bạn có một **Nguồn sự thật chân lý** đảm bảo cho bạn về mặt dữ liệu. Thì giao diện của bạn sẽ phản ứng với dữ liệu thông qua các State hay ta biết đến với từ khoá `@State` huyền thoại. 

Nó sẽ tạo ra tính độc lập của mỗi View. Bạn sẽ hiểu rằng, không phải tất cả dữ liệu đều dồn hết về 1 địa điểm. Nó có thể sử dụng trong nội tại của một View mà thôi. Bạn chỉ cần tương tác với trạng thái (State) của dữ liệu cho giao diện. Như vậy là ổn, vừa riêng tư vừa tiện dụng.

Còn khi bạn thực hiện việc truyền dữ liệu đi (passing data), thì:

* Không cần phải khởi tạo giá trị ban đầu tại View đó.
* Dữ liệu sẽ tham chiếu tới nguồn.
* Mọi cập nhật dữ liệu từ nơi khác vẫn sẽ ảnh hưởng tới nguồn.
* Tất cả các nơi khác khi tham chiếu tới nguồn sẽ đều nhận được sự thay đổi trạng thái.

## "The single source of truth" ở đâu??

Chúng ta đã đi qua khái niệm về **Nguồn sự thật chân lý** và lúc này chúng ta sẽ tìm hiểu nó ở đâu. Như có đề cập ở trên, 

> **The single source of truth** là không phải tập trung hết tất cả dữ liệu về tại một nơi.

Nên ta sẽ có 3 nơi có thể lưu trữ nó.

### 1. Local View

Nguồn sẽ phục vụ chính View của nó. Giúp cải thiện việc không thể thay đổi được khi các SwiftUI View khai báo với `struct`. Bạn xem qua ví dụ đơn giản sau:

```swift
struct View3: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                count += 1
            }, label: {
                Text("Tap nè!")
                    .font(.title)
            })
            .padding()
        }
    }
}
```

Ta khai báo một thuộc tính `count` với kiểu `@State`. Lúc này, `count` là nguồn sự thật chân lý của **View3** này. Nó có khả năng gì?

* Tập trung và lưu trữ dữ liệu tại một nơi (chính là thể hiện của View3)
* Cung cấp dữ liệu cho các View con khác ràng buộc với nó. Bằng cách sử dụng chính `count` để hiển thị.
* Khi có sự thay đổi dữ liệu từ Button, thức là lúc này trạng thái dữ liệu `count` sẽ thay đổi. Điều này sẽ dẫn tới việc các View ràng buộc với nó cũng sẽ thay đổi theo.

Khá đơn giản phải không nào, chỉ là bài cũ nhắc lại thôi. Ahihi!

### 2. Phân cấp View

Ý nghĩa thực sự của **The single source of truth** nằm ở việc truyền tải dữ liệu đi trong phân cấp View. Khi các View cha truyền dữ liệu cho các View con. Quan trọng là khi các view con thay đổi dữ liệu thì ở View cha hay các View khác cũng sẽ thay đổi theo.

Để thực hiện được việc này này, bạn sẽ sử dụng `@Binding` nhằm khai báo thuộc tính ở các View con. Nó giúp tạo một cầu nối 2 chiều từ thuộc tính của View con tới **Nguồn sự thật chân lý**. Và mỗi khi:

* View con thay đổi giá trị dữ liệu của thuộc tính Binding, thì nguồn sẽ thay đổi theo.
* Việc nguồn thay đổi giá trị, dẫn tới trạng thái của nguồn thay đổi.
* Trạng thái dữ liệu sẽ ảnh hưởng tới tất cả các View khác có ràng buộc với nguồn.

Để dễ hình dùng, ta sẽ nâng cấp ví dụ trên. Bằng việc thêm một SwiftUI View nữa. Tham khảo code sau:

```swift
struct CounterButton: View {
    @Binding var count: Int
    
    var body: some View {
        Button(action: {
            count += 1
        }, label: {
            HStack(alignment: .center) {
                Text("Tap nè!")
                    .font(.title)
                Text("(\(count))")
            }
            .padding()
        })
    }
}
```

Bạn chỉ cần chú ý tới khai báo `@Binding` thôi. Mọi cách sử dụng đều bình thường. Ở View này, bạn vẫn thực hiện việc hiển thị và tương tác thay đổi thay đổi giá trị thuộc tính `@Binding`.

Tại View cha sẽ như thế nào, bạn tham khảo tiếp code nhoé.

```swift
struct View3: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                count += 1
            }, label: {
                Text("Tap nè!")
                    .font(.title)
            })
            .padding()
            
            CounterButton(count: $count)
        }
    }
}
```

Chúng ta, sẽ thêm một đối tượng **CounterButton** vào VStack. Điểm chú ý, ta sử dụng `count` nhưng thêm tiền tố `$`. Điều này tạo ra một cầu nối 2 chiều để đảm bảo việc đồng bộ dữ liệu với nhau.

Bạn hãy build lại ví dụ và cảm nhận kết quả nha!

### 3. Root

Nơi cuối cùng chính là **cội nguồn** (Root). Bạn hãy xem qua ví dụ sau:

```swift
@main
struct TestApp: App {
    @StateObject var userDetails = UserDetails()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userDetails)
        }
    }
}
```

Bạn yên tâm về `@StateObject` hay `.environment` , chúng nó sẽ tiếp tục được giới thiệu ở các bài viết sau.

Tại đây, bạn chỉ cần hiểu `@StateObject` cũng tương tự như `@State`. Nó sẽ tạo ra một **The single source of truth**. Trong hoàn cảnh này, nó ở Window, nơi khởi đầu của tất cả.

Kết hợp sử dụng nó như một biến môi trường `environment object`, giúp cho toàn bộ các View trong ứng dụng đều có thể truy cập và sử dụng tới  **The single source of truth** này.

Bạn sẽ không cần phải suy nghĩ quá nhiều về việc truyền tải dữ liệu, hay đưa ra các pattern để sử dụng sao cho hợp lý, hay việc tạo các Data manager nữa. Tất cả đều quy về một mối, trạng thái dữ liệu của nó sẽ ảnh hưởng tới hiển thị của giao diện. Hay có thể là toàn bộ ứng dụng.

Ví dụ như với ví dụ gia tưởng trên.

```swift
if userDetails.isLoggedIn { 
    ContentView() 
 } else { 
    LoginView() 
 }
```

Bạn thực hiện tương tác đăng nhập tại **LoginView**. Khi đăng nhập thành công, bạn thay đổi trạng thái của **nguồn sự thật chân lý**. Các view ràng buộc với nguồn sẽ tự động thay đổi theo. Bạn không cần phải suy nghĩ việc truyền dữ liệu (passing data), hay phản hồi (call back), hay thay đổi luồng (change root) ... nữa.

Qua trên là những gì được xem là cơ bản nhất về **The single source of truth**. Chúc bạn may mắn!

## Tạm kết

* Việc xử lý giao diện không phải lúc nào cũng là đơn giản
* Bản chất của Declarative & Imperative trong xử lý giao diện
* Vấn đề khi truyền tải dữ liệu đi với 2 kiểu đặc trưng (tham chiếu & tham trị)
* Khái niệm về *The single source of truth*
* Nơi lưu trữ của *The single source of truth* & tác động của nguồn lên giao diện

---

Cảm ơn bạn đã theo dõi các bài viết từ **Fx Studio** & hãy truy cập [website](https://fxstudio.dev/) để cập nhật nhiều hơn!
