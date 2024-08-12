// app.js
App({
  onLaunch() {
    this.info()
  },
  info(){
    const that=this
    wx.login({
      success:(res)=>{
        let code=res.code
        wx.request({
          url: this.globalData.server+'/user/getInfo',
          method: 'post', //请求的方式
          data:{ 
            code:code
          },
          header: {
            'Content-Type': 'application/json'
          },
          success:(res)=>{
            if(res.data.code==0){
              that.globalData.avatarUrl=that.globalData.server+res.data.data.image
              that.globalData.openid=res.data.data.id
              that.globalData.nickName=res.data.data.name

              console.log(that.globalData)
            }else{
              wx.showToast({
                icon:'error',
                title: '信息获取失败',
              })
            }
          },
          fail:(res)=>{
            console.log(res)
            wx.showToast({
              icon:'error',
              title: '信息获取失败',
            })
          }
        })
      }
    })
  },
  globalData: {
    server:'http://192.168.0.143:5000',
    openid:'',
    avatarUrl:'',
    nickName:''
  }
})
