// pages/index/index.js
Page({
  to_message(){
    wx.navigateTo({
      url: '../message/message',
    })
  },
  to_identify(){
    wx.navigateTo({
      url: '../identify/identify',
    })
  }

  
})