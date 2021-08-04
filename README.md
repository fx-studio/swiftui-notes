# SwiftUI - Notes

Chào bạn đến với repo nho nhỏ này!

Đây là repo của mình dùng làm lưu trữ và chia sẽ lại cho mọi người trong quán trình tìm hiểu về SwiftUI. Ở đây, repo mang tính chất tổng hợp là chính và không mang tính chất học thuật nào hết.

Nếu bạn có thời gian, hãy ghé sang trang blog của mình. Hi vọng có nhiều thứ hay mà bạn có thể tìm được. Xin cảm ơn!

- Website: https://fxstudio.dev/
- Category SwiftUI: https://fxstudio.dev/category/code/swiftui/
- Contact: [lephuongtien.dev@gmail.com](mailto:lephuongtien.dev@gmail.com)

> Mọi đóng góp hay góp ý từ bạn đều là quý giá đối với mình.

---

## Yêu cầu tối thiểu:

Dấn thân vào nghề iOS đã khó rồi. Ngoài các kiến thức iOS là rất ít tài liệu tiếng việt, cũng như các tài liệu hướng dẫn đầy đủ. Và bạn còn phải đối mặt việc cần phải có thiết bị để bước ra giang hồ đầy sóng gió. Và với SwiftUI thì đã khó nay còn khó hơn nữa. 

Vì SwiftUI ra đời cách đây 1 năm, nên các biên bản Xcode và MacOS của bạn gần như là mới nhất. Đi kèm với đó là cấu hình phần cứng cũng phải đảm bảo được. 

Và chúng ta sẽ cần như sau:

* macOS Mojave (10.14.4) hoặc mới hơn. Lựa chọn tối ưu là MacOS Catalina (10.15).
* Xcode 11 hoặc mới hơn

Cấu hình đề xuất:

* MacOS Catalina
* Xcode 11.5
* Swift 5.2

> Tới đây, bạn vẫn còn cơ hội để suy nghĩ lại là có nên tiếp tục với SwiftUI hay không. Chúc bạn may mắn!

## Danh sách tìm hiểu:

### [Part I : Getting started](https://fxstudio.dev/swiftui-phan-1-lam-quen-voi-swiftui/)

1. [Hello world](./001-Helloworld)
2. [Creating your UI](./002-CreatingUI)
3. [Updating the UI](./003-UpdatingUI)
4. [Presenting an Alert](./004-PresentingAlert)
5. [Extracting Subviews](./005-ExtractingSubviews)

### [Part II : SwiftUI App](https://fxstudio.dev/swiftui-phan-2-co-ban-ve-ung-dung-swiftui-app/) 

1. [SwiftUI App Life Cycle](./006-LifeCycleApp)
2. [Declaring views](./007-DeclaringViews)
   1. [Declarative App Development](./007-DeclaringViews/01_DeclarativeApp.md)
   2. [Declaring Views](./007-DeclaringViews/02_DeclaringViews.md)
   3. [Environment values](./007-DeclaringViews/03_EnvironmentValues.md)
   4. [Reusable Views](./007-DeclaringViews/04_ReusableViews.md)
3. [Basic Layout](./008-BasicLayout)
4. [Declaring Data](./009-DeclaringData)

### [Part III : SwiftUI vs. UIKit](./010-SwiftUIVsUIKit)

1. [SwiftUI in UIKit Project](./010-SwiftUIVsUIKit/011_SwiftUIinUIKit.md)
2. [UIViewController in SwiftUI Project](./010-SwiftUIVsUIKit/012_UIKitinSwiftUI.md)
3. [UIView in SwiftUI Project](./010-SwiftUIVsUIKit/013_UIViewInSwiftUI.md)
4. [Custom UIView in SwiftUI Project](./010-SwiftUIVsUIKit/014_CustomViewInSwiftUI.md)

### [Part IV : Apple Ecosystem](./011-AppleEcosystem)

1. [Swift Package](./011-AppleEcosystem/011_1_SwiftPackage.md)
2. [WatchOS App](./011-AppleEcosystem/011_2_WatchOSApp.md)
3. [Mac Catalyst App](./011-AppleEcosystem/011_3_MacCatalystApp.md)
4. [MacOS App](./011-AppleEcosystem/011_4_MacOSApp.md)
5. [tvOS App](./011-AppleEcosystem/011_5_tvOSApp.md)

### [Part V : Multiplatform App](./012-MultiplatformApp)

1. [Basic Multiplatform App](./012-MultiplatformApp/01_BasicMultiplatformApp.md)
2. [Design & Make color](./012-MultiplatformApp/02_DesignViews.md)
3. [Extra functions](./012-MultiplatformApp/03_ExtraFunctions.md)

### [Part VI : Basic UI Controls](./013-BuildingBlockUI)

1. [Text](./013-BuildingBlockUI/01_Text.md)
2. [Image](./013-BuildingBlockUI/02_Image.md)
3. TextField [(part 1)](./013-BuildingBlockUI/03_Textfield_1.md) & [(part 2)](./013-BuildingBlockUI/03_Textfield_2.md)
4. [Input Controls](./013-BuildingBlockUI/04_InputControls.md) (Button, Toggle, Slider ...)
5. [Layout](./013-BuildingBlockUI/05_Layout.md)
6. [Stacks & Containers](./013-BuildingBlockUI/06_StacksContainers.md)

### [Part VII : State & Data Flow](./014-StateDataFlow)

1. [Tổng quát](./014-StateDataFlow/01_OverView.md)
2. [User Interface State](./014-StateDataFlow/02_UserInterfaceState.md)
3. [The single source of truth](./014-StateDataFlow/03_TheSingleSourceOfTruth.md)
4. [Observation](./014-StateDataFlow/04_Observation.md)
5. [Environment](./014-StateDataFlow/05_Environment.md)
6. [Storing Data](./014-StateDataFlow/06_StoringData.md)

### [Part VIII : Working with List](./015-WorkingWithList)

1. [Simple List](./015-WorkingWithList/01_SimpleList.md)
2. [Dynamic List](./015-WorkingWithList/02_DynamicList.md)
3. [Sections & Grouped](./015-WorkingWithList/03_SectionsGrouped.md)
4. [Editing Mode](./015-WorkingWithList/04_EditingMode.md)
5. [Multiple Selection](./015-WorkingWithList/05_MultipleSelection.md)
6. [Fetching Data form API](./015-WorkingWithList/015-WorkingWithList/06_FetchingData.md)



---

> *Về bản quyền của Repo và mã nguồn trong repo là hoàn toàn miễn phí cho các mục đích phi lợi nhuận và học tập. Tất cả các hành vi sao chép  hay sử dụng vì mục đích thương mại thì đều là vi phạm.*

Cảm ơn bạn đã theo dõi các bài viết từ **Fx Studio** & hãy truy cập [website](https://fxstudio.dev/) để cập nhật nhiều hơn!

