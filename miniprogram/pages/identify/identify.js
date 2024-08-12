// pages/identify/identify.js

const app=getApp().globalData
Page({

  /**
   * 页面的初始数据
   */
  data: {
    flag:false,
    imageUrl:'./../../image/bg.jpg',
    infor:{
      image: '',
      name:'', 
      intro:''
    },   
  },

  // 上传图片
  chooseImg(){
    const that=this
    wx.chooseMedia({
      count: 1, // 可选择的图片数量
      sizeType: ['compressed'], // 压缩图片
      sourceType: ['album', 'camera'], // 来源：相册或相机
      success:  (res)=> {
        console.log(res.tempFiles[0].tempFilePath)
        // 将选择的图片上传到服务器
        that.setData({
          imageUrl:res.tempFiles[0].tempFilePath
        })  
      }
    })
  },

  //识别
  identify(){
    
    const that=this
    if(that.data.imageUrl=='./../../image/bg.jpg'){
      wx.showToast({
        title: '请选择识别图片',
        icon:'error',
        duration: 2000
      })
      return
    }
    wx.showLoading({
      title: '识别中...',
    })
    wx.uploadFile({
      url: app.server+'/herb/identify', // 上传图片的接口地址
      filePath: that.data.imageUrl, // 图片文件路径
      name: 'image', 
      formData:{
        'openid':app.openid
      },
      success: (res) => {
        wx.hideLoading()
        const j=JSON.parse(res.data)
        console.log(j)
        if(j.code!=0){
          wx.showToast({
            title: '图片无法识别',
            icon:'error',
            duration: 2000
          })
        }else{
          that.setData({
            'infor.name':j.data.name,
            'infor.intro':j.data.introduction,
            'infor.image':j.data.image,
            flag:true
          })
        }
        
      },
      fail: function (res) {
        wx.hideLoading()
        console.log(res)
        wx.showToast({
          title: '网络错误',
          icon:'error',
          duration: 2000
        })
      }
    })
  }
})