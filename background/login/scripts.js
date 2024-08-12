document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 防止表单默认提交行为
    
    var username = document.getElementById('username');
    var password = document.getElementById('password');
    var valid = true;

    // 重置之前的验证样式
    username.classList.remove('is-invalid');
    password.classList.remove('is-invalid');

    // 简单的客户端验证
    if (username.value.trim() === '') {
        username.classList.add('is-invalid');
        valid = false;
    }

    if (password.value.trim() === '') {
        password.classList.add('is-invalid');
        valid = false;
    }

    if (valid) {
        // 将数据作为查询参数附加到URL中
        var url = new URL('http://127.0.0.1:5000/admin/login'); // 替换为你的服务器地址


        // 发送POST请求
        fetch(url, {
            method: 'POST', // 请求方式为POST
            headers: {
                'Content-Type': 'application/json;' // 设置请求头
            },
            body: JSON.stringify({ // 传递JSON格式的数据
                user_id: username.value,
                password: password.value
            })
        })
        .then(response => {
            if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json(); // 将响应体解析为JSON
        })
        .then(data => {
            if(data.code==0){
                localStorage.setItem('user', JSON.stringify(data.data));
                alert('登录成功！');
                window.location.href = './../index/index.html';
            }else if(data.code==-1){
                alert('账号不存在');
            }else{
                alert('密码错误');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('登录过程中发生错误，请稍后重试。');
        });
  



        // var params = {
           
        // };
        // url.search = new URLSearchParams(params).toString();

        // // 使用GET请求发送数据POST
        // fetch(url, {
        //     method: 'POST',
        // }).then(response => response.json())
        //   .then(data => {
        //     console.log(data)
        //       if (data.success) {
        //           // 将用户信息存储在localStorage中
        //           localStorage.setItem('user', JSON.stringify(data.user));
        //           alert('登录成功！');
        //           // 重定向到下一页
        //           window.location.href = './../index/index.html'; // 替换为你的目标页面
        //       } else {
        //           alert('登录失败：' + data.message);
        //       }
        //   }).catch(error => {
              
        //   });
    }
});
