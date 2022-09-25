# HomWork-3

     TabBar App

#### App Description
- The App has three ViewController in tabbar
- First VC is LetterListViewController, used tableView here. This VC pulls data from API with URLSession and lists it. from here "https://jsonplaceholder.typicode.com/posts"
- Second VC is GalleryListViewController, used CollectionView here, This VC pulls from API with URLSession like LetterListVC but there are different data, pulls photos "https://jsonplaceholder.typicode.com/photos"
- Kingfisher library was used to capture images
- Third VC is ToDoListViewController, used tableView here. The goal of this VC; go to addToDoList when clicked addbutton and entiry new data and save it go back toDoVC. Later if you click a index go to detailVC and shows data, finally if you click "completed" button in detailVC, go back toDoVC and fill the checkImage
- Get all toDoList from CoreData
- If you have problems about Kingfisher after download zip, you should do fetch or again add Kingfisher in Xcode (Kingfisher installed in app with SPM)

#### Tools I use
- UIKit
- TableView
- CollectionView
- Auto Layout
- CoreData
- API (https://jsonplaceholder.typicode.com)

#### Third Party Library
- KingFisher

#### Software Architectural Pattern
- MVVM

#### Photos

<img src = "https://user-images.githubusercontent.com/103687289/192141038-5e5a2177-9d3d-4c3c-92ef-f2416e908603.png" width="200" hight="200" /><img src = "https://user-images.githubusercontent.com/103687289/192141061-0c6fc3d0-d866-462e-ae02-80ae69b8df94.png" width="200" hight="200" /><img src = "https://user-images.githubusercontent.com/103687289/192141066-b3ba3751-f6cb-4db2-840a-7d8dd6a7a6a5.png" width="200" hight="200" /><img src = "https://user-images.githubusercontent.com/103687289/192141088-12c62c69-4b5e-4cce-bdf8-3e174255f068.png" width="200" hight="200" /><img src = "https://user-images.githubusercontent.com/103687289/192141099-90d8d3a8-8a56-4b25-916e-abf7f61e0e2a.png" width="200" hight="200" /><img src = "https://user-images.githubusercontent.com/103687289/192141127-ecb46f9d-9272-4431-93db-07ce5c2c7f39.png" width="200" hight="200" />
