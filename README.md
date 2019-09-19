# UISplitViewController简单入门

在邮件这个**App**里, 它在**iPad**里划分了两个区域, 左边是一个邮件列表, 右边则是对应的邮件详细内容. **Apple**为我们创建了一个非常方便的**ViewController**, 它的名字叫做**UISplitViewController**. 在这个教程中, 我们将学习如何去使用它, 还有一个事情就是, 在**iOS 8**开始, **UISplitViewController**就可以在**iPad**和**iPhone**上运行.

在本教程中, 我们将会从头开始创建一个通用的**App**, 它使用**UISplitViewController**来显示水果的列表, 我们将使用**UISplitViewController**来处理**iPad**和**iPhone 11**的**Navigation**和显示的问题.

在此之前, 你应该掌握**iOS**开发的一些基础知识, 比如**AutoLayout**和**Storyboard**的使用等等.



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/1.png)



在开始之前, 我们需要下载本教程的一些[课件](https://github.com/CainLuo/Fruit), 这里的课件共有两个, 一个是已经完成了的, 一个是准备让你去完成的.

> 注意: 这里使用的是**Xcode 11**, **iOS 13**和**Swift 5**, 如需转载, 请联系作者, 侵权必究.

## 开始

点击**File ▸ New ▸ Project**, 在**Xcode**中创建一个新的项目, 选择**iOS ▸ Application ▸ Single View App**模板



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/2.png)



将项目命名为**Fruit**, 将开发语言设置为**Swift**, 然后将用户界面设置为**Storyboard**, 如果底下的勾选框勾选了的话, 则要取消掉.



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/3.png)



虽然我们可以选择使用**Master-Detail App**这个模板, 但是为了更好的了解**UISplitViewController**的工作原理, 所以我们将使用**Single View App**模板. 这对我们在将来的项目使用**UISplitViewController**时会更有帮助.

现在我们来创建**App**的主体**UI**, 打开**Main.storyboard**, 这里我们需要把系统自带的**ViewController**删除, 同时也要将项目中的**ViewController.swift**文件也删掉.

然后在**Main.storyboard**中找到**Split View Controller**, 然后拖出来:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/4.png)



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/5.png)



这里会让**Storyboard**添加几个元素:

* **Split View Controller**: 第一个肯定是**UISplitViewController**, 它将是这个**App**的根控制器.

* **Navigation Controller**: 其次是**UINavigationController**, 它将是主控制器的根视图, 在**iPad**或者是比较大尺寸的**iPhone**横屏时, 它将会显示在左侧.

  仔细点查看, 在**UISplitViewController**中, 这个具有**UINavigationController**的控制器, 是它的**Master View Controller**, 这将允许我们在主视图控制器中创建整个**Navigation**的层次结果, 然后又不影响到**Detail View Controller**.

* **View Controller**: 这里将会显示所有水果的详细信息, 如果你仔细点查看**UISplitViewController**, 你会发现**ViewController**是它的**Detail View Controller**.



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/6.png)



* **Table View Controller**: 这是**UINavigationController**的根视图, 它将会显示水果列表.

> 注意: 这个时候由于我们没有**Cell**的重用标识, 所以**Xcode**会有个警告, 这个前往别忘记了.

还有一点要注意的是, 由于我们把自带的**ViewController**给删除了, 所以我们需要告诉**Storyboard**, 我们希望将**UISplitViewController**设置为初始化**ViewController**.

这个时候我们选择**UISplitViewController**, 然后在右侧的"属性"栏, 勾选**Is Initial View Controller**:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/7.png)



勾选了之后, 我们就会在**UISplitViewController**的左侧看到一个箭头, 这就是这个**Storyboard**的初始化控制器.

这个时候, 我们选择**iPad**模拟器, 然后将模拟器横向后, 你就会看到下面这个空白的**UISplitViewController**了:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/8.png)



之前也说了, 自从**iOS 8**之后, 我们也可以运行在**iPhone**上, 只要它的尺寸够大就可以了, 这里我们选择**iPhone 8 Plus**模拟器, 然后就会看到效果:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/9.png)



在横向的大尺寸**iPhone**会和**iPad**显示的效果一样之外, **UISplitViewController**将会和常规的操作一样, 会有**UINavigationController**的**Push**和**Pop**, 这都是系统帮我们实现的, 不需要我们而外再去操作,

## 创建自定义ViewController

现在我们已经有了**Storyboard**主要的控制器结构, 现在我们需要的是在代码上添加数据源, 然后将数据显示出来.

现在我们创建一个名为**MasterViewController**的**UITableViewController**子类, 在创建的过程里, 我们需要把**Also create XIB file**给去掉, 因为在**Storyboard**里已经有了, 然后开发语言为**Swift**, 然后就一直下一步, 到最后完成创建即可.

创建完成了之后, 我们打开**MasterViewController.swift**, 删除一些不需要的代码, 然后添加一些我们需要的代码:

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath)
    return cell
}
```

在运行之前, 我们需要在**Storyboard**中设置一些**UITableViewController**与**UITableViewCell**相关的东西.

* 首先设置**RootViewController**的**Custom Class**设置为**MasterViewController**:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/10.png)



* 其次设置**UITableViewCell**的**Identify**为**FruitCell**, 就和我上们面的代码一致, 然后再设置**Style**为**Basic**:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/11.png)



现在我们可以运行一下, 这个时候你会发现总共有十行, 每行的标题都是一样的, 而且每当我们点击任何的一行都不会发生任何事情.



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/12.png)



这是因为我们还没有创建**DetailViewController**, 现在我们来创建对应的**DetailViewController**, 和上面一样, 这个过程就忽略掉, 只是名称为**DetailViewController**.

创建完成之后, 我们按照同样的方式, 在**Main.storyboard**中, 给**DetailViewController**设置**Custom Class**为**DetailViewController**.

为了让我们的**DetailViewController**能够有东西显示, 这里加一个**UILabel**然后, 写上全世界程序员第一句学的代码**Hello Wirkd!**, 然后在**iPad**模拟器上运行:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/13.png)



现在每当我们点击一下**UITableViewCell**, 在**DetailViewController**中就会显示一个**Hello World!**.

## 制作数据模型

基础知识讲完了, 接下来是来制作我们需要显示的数据模型, 由于现在我们是在演示, 所以这里的数据模型不会很复杂, 更加不会使用到数据持久化.

首先我们需要创建一个名为**Fruit**类, 这里使用的模板是:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/14.png)



我们创建的这个类, 其中包含了水果的图片, 名称, 介绍等等:

```swift
import UIKit

struct Fruit {
    let name: String
    let description: String
    let iconName: String
    
    init(name: String, description: String, iconName: String) {
        self.name = name
        self.description = description
        self.iconName = iconName
    }
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
}
```

现在回到我们的**MasterViewController**.

## 显示水果列表

打开**MasterViewController.swift**之后, 我们需要新增一个**let**的属性:

```swift
let fruits = [
    Fruit(name: "Apple", description: "这是苹果", iconName: "Apple"),
    Fruit(name: "Banana", description: "这是香蕉", iconName: "Banana"),
    Fruit(name: "Blackberry", description: "这是黑莓", iconName: "Blackberry"),
    Fruit(name: "Cherries", description: "这是樱桃", iconName: "Cherries"),
    Fruit(name: "Coconut", description: "这是椰子", iconName: "Coconut"),
    Fruit(name: "Grapes", description: "这是葡萄", iconName: "Grapes")
]
```

这是我们用来显示的具体数据数组.

然后我们找到`tableView(_:numberOfRowsInSection:)`并将return语句替换为以下内容: 

```swift
return fruits.count
```

接下来, 我们需要将名称显示到**UITableViewCell**中, 找到`tableView(_:cellForRowAtIndexPath:)`, 并且在**return**的语句之前添加下面的代码:

```swift
let fruti = fruits[indexPath.row]
cell.textLabel?.text = fruti.name
```

这将会把水果的名称显示到**UITableViewCell**中, 现在我们运行一下项目:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/15.png)



现在我们成功的将水果名称显示在**UITableViewCell**中了.

## 更改**MasterViewController**的标题

为了让**MasterViewController**的标题看起来更加的贴合, 我们可以修改一下它的标题, 修改标题有两种方式, 第一种是直接在**Storyboard**中修改:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/16.png)



第二种是在代码上修改:

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    title = "Fruit List"
}
```

无论哪种都可以, 但如果你所在的公司有固定的代码规范, 那就按照公司的规范来.

## 显示水果的详细内容

现在在**TableView**中我们已经显示了水果的名称, 现在我们是时候来完善每当点击**Cell**的时候, **DetailViewController**则会显示对应的内容了.

打开**Main.storyboard**, 将原来我们添加到**DetailViewController**里面的内容删掉, 然后再添加我们所需要展示的内容:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/17.png)



下面是我们需要添加的内容:

* 最左边是用来显示水果样子的**UIImageView**, 它的尺寸是**128x128**
* 右边最上面的是用来显示水果名称的**UILabel**, 它用的是系统粗体, 字号为**28**
* 右边最下面的是用来显示水果详情的**UILabel**, 它用的是系统常规, 字号为**17**
* 这里使用了两个**UIStackView**, 第一个是用在两个**UILabel**里, 排序方式是竖向的, 并且设置它们之间的间距为**10**, 第二个则是用在**UIImageView**和第一个**UIStackView**, 它的排序方式是横向的, 并且设置它们之间的间距为**15**.

这里使用**UIStackView**可以帮助我们省下很多使用**AutoLayout**的布局问题, 现在布局完成了, 我们来将**UIKit**控件和**DetailViewController**关联.

打开**DetailViewController.swift**, 然后将下面的代码添加进去:

```swift
@IBOutlet weak var imageView: UIImageView!

@IBOutlet weak var nameLabel: UILabel!
@IBOutlet weak var descriptionLabel: UILabel!

var furti: Fruit? {
    didSet {
        refreshUI()
    }
}

private func refreshUI() {
  loadViewIfNeeded()
  nameLabel.text = furti?.name
  descriptionLabel.text = furti?.description
  imageView.image = furti?.icon
}
```

接下来, 我们则需要在**Storyboard**中, 去关联这里的属性:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/18.png)



现在, 我们准备就绪了, 只差将数据显示就可以了, 打开**SceneDelegate.swift**, 然后将下面的代码替换`scene(_:willConnectTo:options :)`的内部实现:

```swift
guard
  let splitViewController = window?.rootViewController as? UISplitViewController,
  let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
  let masterViewController = leftNavController.viewControllers.first as? MasterViewController,
  let detailViewController = (splitViewController.viewControllers.last as? UINavigationController)?.topViewController as? DetailViewController
  else { fatalError() }

let firstMonster = masterViewController.fruits.first
detailViewController.furti = firstMonster
```

在**UISplitViewController**中, 它有一个名为**ViewControllers**的属性, 其中是包含了**MasterViewController**和**DetailViewController**, 在我们这个情况下, **MasterViewController**实际上就是**NavigationController**, 所以我们如果要获取真正的**MasterViewController**实例, 就需要获得**NavigationController**中的一个**ViewController**.

要获取**DetailViewController**也是使用同样的方式, 只不过是获取**UISplitViewController**中的**ViewControllers**最后一个**ViewController**.

现在我们运行项目, 就可以看到有关于水果的详情信息:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/19.png)



但现在我们又面临了一个问题, 无论我们点击哪个**UITableViewCell**, 都只会显示苹果的信息, 接下来我们就需要解决这个问题.

## 使用delegate完善DetailViewController的显示内容

关于两个控制器之间的通信方式有很多种, 在**Master-Detail App**的模板中, **MasterViewController**有着对**DetailViewController**的引用, 这就意味着**MasterViewController**可以在**DetailViewController**上设置属性了.

这如果只是在一个简单的**ViewController**中则可以直接使用, 但在我们这种情况, 还是遵循**UISplitViewController**类引用中的建议方法来处理, 那就是添加**delegate**.

打开**MasterViewController.swift**, 并且在这个类的上面添加下面的代码:

```swift
protocol FruitSelectionDelegate: class {
    func furitSelected(_ newFurit: Fruit)
}
```

这定义了一个带有名为**furitSelected**方法的协议, 我们将会在**DetailViewController**中实现这个方法, 并且在**MasterViewController**中将用户选择的水果发送过去.

接下来, 我们需要定义一个**delegate**属性:

```swift
weak var delegate: FruitSelectionDelegate?
```

这就意味着**delegate**属性需要一个实现了`furitSelected(_:)`方法的对象, 由于我们希望**DetailViewController**在用户点了不同的水果时就更新内容, 所以我们需要在**DetailViewController**中实现这个代理方法:

```swift
extension DetailViewController: FruitSelectionDelegate {
    func furitSelected(_ newFurit: Fruit) {
        self.furti = newFurit
    }
}
```

这里我们使用**extension**可以让代码看起来更加的明确, 现在我们在**DetailViewController**中实现了这个代理方法, 那么接下来, 我们还需要在**MasterViewController**里, 实现这个传递的细节:

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedFruits = fruits[indexPath.row]

    delegate?.furitSelected(selectedFruits)
}
```

最后, 我们还需要在**SceneDelegate.swift**的`scene(_:willConnectTo:options:)`方法中, 将**DetailViewController**设置为**MasterViewController**的代理:

```swift
masterViewController.delegate = detailViewController
```

现在我们已经完成了**MasterViewController**和**DetailViewController**之间的通信了.



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/20.png)



现在看上去一切都好像非常的完美, 但如果我们需要在**iPhone**上运行它, 那么在**MasterViewController**选择水果时就不会显示**DetailViewController**了, 这里我们需要进行一丢丢的优化, 确保在**iPhone**上也可以正常运行.

打开**MasterViewController.swift**, 找到`tableView(_:didSelectRowAt:)`方法, 然后将下面的内容添加到内部代码的最后面:

```swift
if let detailViewController = delegate as? DetailViewController {
    splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
}
```

首先, 我们确保我们的**Delegate**对象是**DetailViewController**实例, 然后在**UISplitViewController**上调用`showDetailViewController(_: sender:)`时, 将**DetailViewController**传递进去, 这里有一点要说明, **UIViewController**本身是有一个叫做**splitViewController**的属性, 它将会引用已经存在的**ViewController**.

经过这个简单的改动, 在**iPhone**上它就可以正常运行了, 只是添加了几行代码, 我们就可以在**iPad**和**iPhone**上使用完整的**UISplitViewController**了.



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/21.png)



## 完善iPad的纵向显示

在横向显示的时候, **iPad**会自动在左边显示菜单栏, 但是在纵向时, 只能通过手势从左往右的滑动才会显示, 在点击菜单栏以外的位置, 它就会自动隐藏掉.

虽然这种滑动显示的方式很高大上, 但如果我们要像**iPhone**那样, 在左上方有一个显示菜单的按钮该怎么做呢? 这个时候我们只需要对**App**进行一丢丢的优化就可以了.

首先我们打开**Main.storyboard**, 给**DetailViewController**添加一个**UINavigationController**, 这里有两种添加的方式.

* 第一种



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/22.png)



* 第二种



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/23.png)



无论哪种其实都是可以的, 没有任何的区别, 下面是完成了添加的**storyboard**:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/24.png)



现在我们打开**MasterViewController**, 找到`tableView(_:didSelectRowAt:)`, 修改一下我们之前调用`showDetailViewController(_:sender:)`的小细节:

```swift
if let detailViewController = delegate as? DetailViewController,
    let detailNavigationController = detailViewController.navigationController {
    splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
}
```

这里我们将显示**DetailViewController**修改成显示**DetailViewController**的**NavigationController**, 但无论怎么改, 这个**NavigationController**的根视图依然是**DetailViewController**, 和我们之前看到的内容依然是一样的.

接下来, 我们需要在**SceneDelegate.swift**的`scene(_willConnectTo:options:)`中, 修改初始化**detailViewController**的代码:

```swift
let detailViewController = (splitViewController.viewControllers.last as? UINavigationController)?.topViewController as? DetailViewController
```

因为**DetailViewController**是存在于**UINavigationController**中, 所以我们这里需要通过访问两层来获取到它的实例.

最后, 我们在方法结束之前, 添加下面的两行代码:

```swift
detailViewController.navigationItem.leftItemsSupplementBackButton = true
detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
```

这两行代码是用来告诉**DetailViewController**的左上角按钮是用来显示**UISplitViewController**的, 在**iPhone**不会有任何的改变, 但是在**iPad**上会有一个按钮用来显示菜单的**UITableView**.

下面就是我们运行的效果:



![图片](https://raw.githubusercontent.com/CainLuo/Fruit/master/Images/25.png)



## 总结

通过简单的事例, 我们学习了**UISplitViewController**的使用, 虽然这个例子比较简单, 但是可以通过该例子慢慢的延展出更多的使用场景, 谢谢大家的阅读.

