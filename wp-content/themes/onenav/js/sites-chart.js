loadFunc(function() {
    loadChart();
});
function loadChart() {
    ioChart = echarts.init(domChart,chartTheme);
    var post_data;
    ioChart.showLoading();
    jQuery.ajax({
        type : 'POST',
        url : theme.ajaxurl,  
        dataType: 'json',
        data : {
            action: "get_post_ranking_data",
            data: jQuery(domChart).data(),
        },
        success : function( response ){
            ioChart.hideLoading();
            if(response.status==1){
                post_data= response.data;
                var _series = post_data.series;
                var Max1 = calMax(post_data.count);
                var _yAxisData = [
                        {
                            type: 'value',
                            axisLine: {
                                show: false
                            },
                            axisLabel: {
                                formatter: '{value}'
                            },
                            max: Max1,
                            splitNumber: 4,
                            interval: Max1 / 4
                        }
                    ];
                var _seriesData = [
                        {
                            name: _series[0],
                            type: 'bar',
                            data: post_data.desktop
                        },
                        {
                            name: _series[1],
                            type: 'bar',
                            data: post_data.mobile
                        },
                        {
                            name: _series[2],
                            type: 'line',
                            smooth: true,
                            data: post_data.count
                        }
                    ];
                if(response.type == "down"){
                    var Max2 = calMax(post_data.download);
                    _yAxisData.push(
                        {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value}'
                            },
                            max: Max2,
                            splitNumber: 4,
                            interval: Max2 / 4
                        }
                    );
                    _seriesData.push(
                        {
                            name: _series[3],
                            type: 'line',
                            yAxisIndex: 1,itemStyle:{
                                normal:{
                                    lineStyle:{
                                        width:2,
                                        type:'dotted'
                                    }
                                }
                            },
                            data: post_data.download
                        }
                    );
                }
                chartOption = {
                    backgroundColor:'rgba(0,0,0,0)', 
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'none',
                            crossStyle: {
                                color: '#999'
                            }
                        }
                    }, 
                    grid:{
                        top:'80',
                        bottom: '60'
                    },
                    legend: {
                        top: '24',
                        data: _series
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: post_data.x_axis,
                            axisPointer: {
                                type: 'shadow'
                            },  
                            axisLabel: {   
                                formatter: function(value) {
                                    return echarts.format.formatTime("MM.dd", new Date(value));
                                },
                            },
                        }
                    ],
                    yAxis: _yAxisData, 
                    series: _seriesData
                };
                if (chartOption && typeof chartOption === 'object') {
                    ioChart.setOption(chartOption);
                };
            }else{
                showAlert(JSON.parse('{"status":4,"msg":"'+localize.networkerror+'"}'));
            }
        },
        error:function(){ 
            showAlert(JSON.parse('{"status":4,"msg":"'+localize.networkerror+'"}'));
        }
    });
};
function calMax(arrs) {
    var max = arrs[0];
    for(var i = 1,ilen = arrs.length; i < ilen; i++) {
        if(arrs[i] > max) {
            max = arrs[i];
        }
    }
    if(max<4)
        return 4;
    else
        return Math.ceil(max/4)*4;
}