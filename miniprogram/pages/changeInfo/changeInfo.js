const app=getApp().globalData
 
 
Page({
/**
   * 页面的初始数据
   */
  data: {
    avatarUrl: app.avatarUrl,
    nickName:app.nickName
  },
 
  onChooseAvatar(e) {
    console.log(e.detail.avatarUrl)
    const avatarUrl= e.detail.avatarUrl
    console.log(avatarUrl)
    this.setData({
      avatarUrl:avatarUrl,
    })
    app.avatarUrl = avatarUrl
  },
  formSubmit(e){
    const that=this

    app.nickName = that.data.nickName
    console.log(app.nickName)

    if(that.data.nickName==''){
      wx.showToast({
        title: '请填写修改昵称',
        icon:'error',
        duration: 2000
      })
      return
    }
    wx.showLoading({
      title: '修改中...',
    })

    if(that.data.avatarUrl==app.avatarUrl){
      const that=this
      wx.request({
        url: app.server+'/user/changeNickName',
        method: 'post', //请求的方式
        data:{ 
          'openid':app.openid,
          'nickName':that.data.nickName
        },
        header: {
          'Content-Type': 'application/json'
        },
        success:(res)=>{
          wx.hideLoading()
          if(res.data.code==0){
            
            wx.showToast({
              title: '修改成功',
              icon:'success',
              duration: 2000
            })
          }else{
            wx.hideLoading()
            wx.showToast({
              title: '修改失败',
              icon:'error',
              duration: 2000
            })
          }
        },
        fail:(res)=>{
          console.log(res)
          wx.showToast({
            title: '修改失败',
            icon:'error',
            duration: 2000
          })
        }
      })
    }
    else{
      wx.uploadFile({
        url: app.server+'/user/changeInfo', // 上传图片的接口地址
        filePath: that.data.avatarUrl, // 图片文件路径
        name: 'file', 
        formData:{
          'openid':app.openid,
          'nickName':that.data.nickName
        },
        success: (res) => {
          console.log(res)
          wx.hideLoading()
          const j=JSON.parse(res.data)
          console.log(j)
          if(j.code!=0){
            wx.showToast({
              title: '修改失败',
              icon:'error',
              duration: 2000
            })
          }else{
            wx.showToast({
              title: '修改成功',
              icon:'success',
              duration: 2000
            })
            console.log(j.data.image)
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
  },
  in_nickName(e){
    console.log(e.detail.value)
    const  value  = e.detail.value
    this.setData({
      nickName: value
    })
  },

 
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    // console.log(this.data.nickName)
    this.setData({
      nickName:app.nickName
    })
  },

  uploadImg(){
    const that=this
    wx.chooseMedia({
      count: 1, // 可选择的图片数量
      sizeType: ['compressed'], // 压缩图片
      sourceType: ['camera','album'], // 来源：相册或相机
      success:  (res)=> {
        console.log(res.tempFiles[0].tempFilePath)
        app.localUrl=res.tempFiles[0].tempFilePath
        // 将选择的图片上传到服务器
        that.setData({
          avatarUrl:res.tempFiles[0].tempFilePath
        })  
      }
    })
  }
})