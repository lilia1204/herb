const DEFAULT_PAGE = 0;
const app=getApp().globalData;

Page({
  
  data: {
    CurIdx:0,
  	flag:true,
    list: [],
    searchName:'',
  },
  rotateFn(e){
    const that=this
  	this.setData({
      flag:!that.data.flag
    })
  },
  onLoad(){
    wx.showToast({
      title: '点击可查看详情',
      icon:'none',
      duration: 2000
    })
    this.test()
    
  },
  test(){
    var that = this
    wx.request({
      url: app.server+'/herb/getList',
      method: 'GET',
      success: function(res){
        console.log(res.data)
        if(res.data.code!=0){
          wx.showToast({
            title: '获取信息失败',
            icon:'error',
            duration: 2000
          })
          return
        }
        that.setData({
          list:res.data.data
        })
      },
      fail: function() {
        wx.showToast({
          title: '网络错误',
          icon:'error',
          duration: 2000
        })
      }
    })
  },


  CurSel(e){
    this.setData({
      CurIdx: e.detail.current,
      flag:true
     })
  },
  nameInput(e){
    console.log(e.detail.value)
    this.data.searchName=e.detail.value
  },
  search(){
    const that=this
    if(that.data.searchName==''){
      wx.showToast({
        title: '请输入搜索名字',
        icon:'none',
        duration: 2000
      })
      return 
    }


    for(let i =0;i<this.data.list.length;i++){
      if(that.data.searchName==that.data.list[i].name){
        that.setData({
          CurIdx:i
        })
        return
      }
    }


    wx.showToast({
      title: '无该草药信息',
      icon:'none',
      duration: 2000
    })
  }
})