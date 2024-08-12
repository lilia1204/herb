// pages/myInfo/index.js
const app=getApp().globalData
Page({

  /**
   * 页面的初始数据
   */
  data: {
    avatarUrl: app.avatarUrl,
    nickname:app.nickName,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    console.log(1)
  },
  onShow(){
    this.setData({
      avatarUrl: app.avatarUrl,
    nickname:app.nickName,
    })
  },
  navigateToAbout(){
    wx.navigateTo({
      url: './../aboutUs/aboutUs',
    })
  },
  navigateToChangeInfo(){
    wx.navigateTo({
      url: './../changeInfo/changeInfo',
    })
  },
  onChooseAvatar(e) {
    console.log(e.detail.avatarUrl)
    const {
        avatarUrl
    } = e.detail
    this.setData({
        avatarUrl,
    })

    console.log(avatarUrl)
},

})