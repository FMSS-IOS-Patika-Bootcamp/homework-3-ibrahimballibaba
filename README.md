# HomWork-3

     TabBar App

#### App Description
- The App has three ViewController in tabbar
- First VC is LetterListViewController, used tableView here. This VC pulls data from API with URLSession and lists it. from here "https://jsonplaceholder.typicode.com/posts"
- Second VC is GalleryListViewController, used CollectionView here, This VC pulls from API with URLSession like LetterListVC but there are different data, pulls photos "https://jsonplaceholder.typicode.com/photos"
- Kingfisher library was used to capture images
- Third VC is ToDoListViewController, used tableView here. The goal of this VC; go to addToDoList when clicked addbutton and entiry new data and save it go back toDoVC. Later if you click a index go to detailVC and shows data, finally if you click "completed" button in detailVC, go back toDoVC and fill the checkImage
- Get all toDoList from CoreData
- If you have problems about Kingfisher after download zip, you should do fetch or again add Kingfher in Xcode (Kingfisher installed in app with SPM)

#### Tools I use
- UIKit
- TableView
- CollectionView
- Auto Layout

#### Third Party Library
- KingFisher

#### Design Pattern Architecture
- MVVM

#### Photos
