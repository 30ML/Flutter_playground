BottomNavigationBar(
  onTap: controller.changeTabIndex,
  currentIndex: controller.tabIndex,
  items: [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,),),),
  ],
)