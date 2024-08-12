document.addEventListener('DOMContentLoaded', function() {

    //显示管理员信息
    function displayUserData() {
        const userInfoHtml = `
            <p>${user.name}</p>
            <p>管理员</p> 
        `;
        changeContext('user-info',userInfoHtml)

    }
    

    const storedData = localStorage.getItem('user');
    const user = JSON.parse(storedData);
    console.log(user);
    displayUserData(user);
    getMessage(user)

    function getMessage(user){

        var url = new URL('http://127.0.0.1:5000/record/get_data'); // 替换为你的服务器地址


        // 发送POST请求
        fetch(url, {
            method: 'POST', // 请求方式为POST
            headers: {
                'Content-Type': 'application/json;' // 设置请求头
            },
            body: JSON.stringify({ // 传递JSON格式的数据
                user_id: user.id,
                token: user.token
            })
        })
        .then(response => {
            if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json(); // 将响应体解析为JSON
        })
        .then(data => {
            
            displayData(data)
        })
        .catch(error => {
            console.error('Error:', error);
            alert('登录过程中发生错误，请稍后重试。');
        });
    }



    function displayData(res){
        console.log(res)
        const userNumHtml = `
            <p>${res.data.user_num}</p>           
        `;
        changeContext('userNum',userNumHtml)

        const hisNum = `
            <p>${res.data.his_query_num}</p>           
        `;
        changeContext('hisNum',hisNum)


        const todayNum = `
            <p>${res.data.to_query_num}</p>           
        `;
        changeContext('todayNum',todayNum)

        LineChart(res.data.five_days_query_num.labels,res.data.five_days_query_num.data)
        pieChart(res.data.record.lable,res.data.record.data)
    }
    function changeContext(id,InfoHtml){
        const InfoDiv = document.getElementById(id);
        InfoDiv.innerHTML = InfoHtml;
    }

    // Line Chart
   function LineChart(labelsData,Data){
    labelsData.reverse()
    Data.reverse()
    var ctxLine = document.getElementById('lineChart').getContext('2d');
    var lineChart = new Chart(ctxLine, {
        type: 'line',
        data: {
            labels: labelsData,
            datasets: [
                {
                    label: '搜索量',
                    data: Data,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                },
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: false,
                    ticks: {
                        stepSize: 1 // 设置步进大小为 1，确保显示整数
                    }
                }
            }
        }
    });
   }

   function pieChart(labelsData,Data){
        // Pie Chart
    var ctxPie = document.getElementById('pieChart').getContext('2d');
    var pieChart = new Chart(ctxPie, {
        type: 'pie',
        data: {
            labels: labelsData,
            datasets: [{
                data:Data,
                backgroundColor: generateUniformRGB(labelsData.length,0.3),
                borderColor: generateUniformRGB(labelsData.length,1),
                borderWidth: 1
            }]
        },
        options: {
            responsive: true
        }
    });
   }

   function generateUniformRGB(n,x) {
    const colors = [];
    for (let i = 0; i < n; i++) {
        const r = Math.floor(255 * i / n); // 均匀分布的 r
        const g = Math.floor(255 * (n - i) / n); // 均匀分布的 g
        const b = 2; // 固定 b 值为 128（你可以根据需求调整）
        colors.push(`rgba(${r}, ${g}, ${b}, ${x})`);
    }
    console.log(colors)
    return colors;
}
    
});
