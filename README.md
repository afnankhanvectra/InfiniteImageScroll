# InfiniteImageScroll
infinite image scroll is a testing project for infite scrolling with time delay. Images can pass by url or by images. You can modify time , scrolling and other parametes as well. 



### Integration

- copy ***InfiniteImage*** folder in your project
- install ***SDWebImage*** pod
- make a view in storyboard  and ***KNAttempterListView*** child view and make IBOutlet in controller
- Pass either images in (userImages) or images url in (userURLs)
- Controll scrolling by shouldScrollimagesAutomatic (by default its true)
- Change  image change duration (TIME_GAP)(by default its 2.0)

Check viewcontroller of project for demo.




![Video](https://res.cloudinary.com/dlikzl3m2/video/upload/v1543350134/Github/Infinite-image.gif)