root = global ? window

require.config({
    paths: {
        echarts: '/static/js/echarts/dist',
        theme:'/static/js/echarts/dist/theme'
    }
})

options={
    ChartA:{
        title : {
            text: '最热关键词之 —— 形容词',
            x:'center'
        },
        tooltip : {
            show:true,
        },
        toolbox: {
            show : true,
            feature : {
                magicType : {
                    show: true,
                    type: ['pie','funnel'],
                    option: {
                        funnel: {
                            tooltip : {
                                show:true,
                                trigger: 'item',
                                formatter: "{a} <br/>{b} "
                            }
                        },
                        pie:{
                          radius : '55%',
                          center: ['50%', '60%'],
                          tooltip : {
                                show:true,
                                trigger: 'item',
                                formatter: "{a} <br/>{b} ({d}%)"
                          }
                        }
                    }
                },
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'关键词',
                type:'funnel',
                width: '60%',
                funnelAlign: 'left',
                data:[
                ]
            }
        ]
    },
    ChartB:{
        title : {
            text: '最热关键词之 —— 名词',
            x:'center'
        },
        tooltip : {
            show:true,
        },
        toolbox: {
            show : true,
            feature : {
                magicType : {
                    show: true,
                    type: ['funnel','pie'],
                    option: {
                        funnel: {
                            tooltip : {
                                show:true,
                                trigger: 'item',
                                formatter: "{a} <br/>{b} "
                            }
                            width: '60%',
                            funnelAlign: 'right',
                        },
                        pie:{
                          radius : '55%',
                          center: ['50%', '60%'],
                          tooltip : {
                                show:true,
                                trigger: 'item',
                                formatter: "{a} <br/>{b} ({d}%)"
                          }
                        }
                    }
                },
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'关键词',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[]
            }
        ]
    },
  ChartC:{
      backgroundColor: '#1b1b1b',
      color: ['gold','aqua','lime'],
      title : {
          text: '全国分布',
          x:'center',
          textStyle : {
              color: '#fff'
          }
      },
      tooltip : {
          trigger: 'item',
          formatter: '{b}'
      },
      toolbox: {
          show : true,
          orient : 'vertical',
          x: 'right',
          y: 'center',
          feature : {
              saveAsImage : {show: true}
          }
      },
      dataRange: {
          min : 0,
          max : 100,
          calculable : true,
          color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
          textStyle:{
              color:'#fff'
          }
      },
      series : [
          {
              name: '全国',
              type: 'map',
              roam: true,
              hoverable: false,
              mapType: 'china',
              itemStyle:{
                  normal:{
                      borderColor:'rgba(100,149,237,1)',
                      borderWidth:0.5,
                      areaStyle:{
                          color: '#1b1b1b'
                      }
                  }
              },
              data:[],
              geoCoord: {
                  '上海': [121.4648, 31.2891],
                  '北京': [116.28, 39.54],
                  '天津': [117.11, 39.09],
                  '重庆': [106.32, 29.32],
                  '黑龙江': [126.41, 45.45],
                  '吉林': [125.19, 43.52],
                  '辽宁': [123.24, 41.5],
                  '内蒙古': [111.48, 40.49],
                  '河北': [114.28, 38.02],
                  '山西': [112.34, 37.52],
                  '山东': [117, 36.38],
                  '河南': [113.42, 34.48],
                  '陕西': [108.54, 34.16],
                  '甘肃': [103.49, 36.03],
                  '宁夏': [106.16, 38.2],
                  '青海': [101.45, 36.38],
                  '新疆': [87.36, 43.48],
                  '安徽': [117.18, 31.51],
                  '江苏': [118.5, 32.02],
                  '浙江': [120.09, 30.14],
                  '湖南': [113, 28.11],
                  '江西': [115.52, 28.41],
                  '湖北': [114.21, 30.37],
                  '四川': [104.05, 30.39],
                  '贵州': [106.42, 26.35],
                  '福建': [119.18, 26.05],
                  '台湾': [121.31, 25.03],
                  '广东': [113.15, 23.08],
                  '海南': [110.2, 20.02],
                  '广西': [108.2, 22.48],
                  '云南': [102.41, 25],
                  '西藏': [90.08, 29.39],
                  '香港': [114.1, 22.18],
                  '澳门': [113.35, 22.14],
                  '其他': [118.5, 32.02],
                  '海外': [131.4648, 41.2891]
              }
          },
          {
              name: '全国分布',
              type: 'map',
              mapType: 'china',
              data:[],
              markLine : {
                  smooth:true,
                  effect : {
                      show: true,
                      scaleSize: 1,
                      period: 30,
                      color: '#fff',
                      shadowBlur: 10
                  },
                  itemStyle : {
                      normal: {
                          borderWidth:1,
                          lineStyle: {
                              type: 'solid',
                              shadowBlur: 10
                          }
                      }
                  },
                  data : [
                      [{name:'江苏'}, {name:'江苏',value:95}],
                      [{name:'江苏'}, {name:'上海',value:90}],
                      [{name:'江苏'}, {name:'山东',value:80}],
                      [{name:'江苏'}, {name:'新疆',value:70}],
                      [{name:'江苏'}, {name:'广东',value:60}],
                      [{name:'江苏'}, {name:'西藏',value:50}],
                      [{name:'江苏'}, {name:'甘肃',value:40}],
                      [{name:'江苏'}, {name:'陕西',value:30}],
                      [{name:'江苏'}, {name:'四川',value:20}],
                      [{name:'江苏'}, {name:'浙江',value:10}]
                  ]
              },
              markPoint : {
                  symbol:'emptyCircle',
                  symbolSize : (v)->
                      2 + v/10
                  ,
                  effect : {
                      show: true,
                      shadowBlur : 0
                  },
                  itemStyle:{
                      normal:{
                          label:{show:false}
                      },
                      emphasis: {
                          label:{position:'top'}
                      }
                  },
                  data : [
                      {name:'江苏',value:0},
                  ]
              }
          }
      ]
  }

}


getDatas=(option)->
  'aaa'


@drawChartA =->
    # 使用
    require(
            [
                'echarts',
                'echarts/chart/pie', # 使用柱状图就加载bar模块，按需加载
                'echarts/chart/funnel',
                'echarts/chart/map', # 使地图
                'echarts/theme/dark'
            ],
             (ec)->
                # 基于准备好的dom，初始化echarts图表
                myChart = ec.init(document.getElementById('keywords'),'dark');
                myChart2 = ec.init(document.getElementById('keywords2'),'dark');
                myChart3 = ec.init(document.getElementById('keywords3'),'dark');
                $.get('/static/a.json',(res,status)->
                    option = options.ChartA ;
                    option.series[0].data=res.data
                    option.series[0].max=res.data[0]['value']
                    myChart.setOption(option);

                    require(['echarts/theme/' + 'dark'], (tarTheme)->
                      myChart.setTheme(tarTheme);
                    )
                ,'json')

                $.get('/static/n.json',(res,stuta)->
                    option=options.ChartB
                    option.series[0].data=res.data
                    option.series[0].max=res.data[0]['value']

                    myChart2.setOption(option);


                    require(['echarts/theme/' + 'dark'], (tarTheme)->
                      myChart2.setTheme(tarTheme);
                    )
                ,'json')

                $.get('/static/p.json',(res,status)->
	                option=options.ChartC
	                option.series[1].markPoint.data=res
	                list=[]
	                $.each(res,()->
	                    list.push([{name:'江苏'}, this])
	                )
	                console.log(list)
	                option.series[1].markLine.data=list
	                myChart3.setOption(option)

	                require(['echarts/theme/' + 'dark'], (tarTheme)->
	                    myChart3.setTheme(tarTheme);
	                )

                ,'json')






    )


