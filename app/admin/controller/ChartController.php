<?php
/**
 * 数据报表
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

use Elasticsearch\ClientBuilder;

class ChartController extends CommonController{
    private $channel   	= null;		// 渠道
    private $startDate	= null;		// 开始时间
    private $endDate	= null;		// 结束时间
    private $option		= null;		// Chart参数
    private $os			= null;		// 系统
    private $sex		= null;		// 性别
    private $rank		= null;		// 等级
    private $qtype		= null;		// 查询类型（流失状况、流失状况等级分析）
    private $power		= null;		// 用户权限（游客、授权）
    private $esc		= null;		// ES客户端

    public function __construct()
    {
        parent::__construct();
        $this->breadcrumb[]=array(
            'text'  =>'数据报表'
        );

        $this->esc=ClientBuilder::create()->setHosts(C('ES_HOST'))->build();

        $date=I('date','trim');
        if (!empty($date)){
            $date=explode('to', $date);
            $date=array_map('trim', $date);
            $this->startDate=$date[0];
            $this->endDate=$date[1];
        }

        $this->os		= I('os','', 'trim');
        $this->sex		= I('sex','', 'trim');
        $this->rank		= I('rank','', 'trim');
        $this->qtype	= I('qtype','', 'trim');
        $this->power	= I('power','', 'trim');
        $this->channel	= I('channel','', 'trim');

        $this->option=array(
            'tooltip'	=> array(
                'trigger'	=> 'axis'
            ),
            'legend'	=> array(),
            'xAxis'		=> array(
                'type'			=> 'category',
                'boundaryGap'	=> false,
                'data'			=> array()
            ),
            'yAxis'		=> array(
                'type'	=>'value'
            ),
            'series'	=> array()
        );

    }

    /**
     * 登录报表
     * @author zhang qing <490702087@qq.com>
     */
    public function userLogin(){
        if (IS_POST) {
            // 创造legend关联数组，与es聚合结果键名一致
            $legend=array(
                'all_ipcount'		=> '全部用户',
                'ios_ipcount'		=> 'IOS用户',
                'android_ipcount'	=> 'Android用户',
                'other_ipcount'		=> '其它用户',
                'robot_ipcount'		=> '机器人',
                'pc_ipcount'		=> '电脑'
            );

            $this->option['legend']=array(
                'data'=>array_values($legend)
            );

            /**
             * 输出 xAxis 日期轴
             * 查询对应日期日志，保存到 $results
             */
            $results=array();
            for ($i=strtotime($this->startDate); $i<=strtotime($this->endDate); $i=strtotime('+1 day', $i)) {
                $date=date('Y-m-d', $i);
                $this->option['xAxis']['data'][]=$date;

                $params=[
                    'index'=>'logstash-onlinelog-*',
                    'from'=>0,
                    'size'=>10,
                    'body'=>[
                        'query'=>[
                            'bool'=>[
                                'must'=>[
                                    'range'=>[
                                        '@timestamp'=>[
                                            'gte' => $date.'T00:00:00',
                                            'lte' => $date.'T23:59:59',
                                            "time_zone"=>"+08:00"
                                        ]
                                    ]
                                ],
                                'filter'=>[[
                                    'term'=>[
                                        'jsoncontent.desc.raw'=>'login success'
                                    ]]
                                ]
                            ]
                        ],
                        'aggregations'=>[
                            'all_ipcount'=>[
                                'cardinality'=>[
                                    'field'=>'jsoncontent.guid.raw'
                                ]
                            ],
                            'ios_ipcount'=>[
                                'filter'=>[
                                    'term'=>[
                                        'jsoncontent.os.raw'=>'2'
                                    ]
                                ],
                                'aggregations'=>[
                                    'ipcount'=>[
                                        'cardinality'=>[
                                            'field'=>'jsoncontent.guid.raw'
                                        ]
                                    ]
                                ]
                            ],
                            'android_ipcount'=>[
                                'filter'=>[
                                    'term'=>[
                                        'jsoncontent.os.raw'=>'1'
                                    ]
                                ],
                                'aggregations'=>[
                                    'ipcount'=>[
                                        'cardinality'=>[
                                            'field'=>'jsoncontent.guid.raw'
                                        ]
                                    ]
                                ]
                            ],
                            'other_ipcount'=>[
                                'filter'=>[
                                    'term'=>[
                                        'jsoncontent.os.raw'=>'0'
                                    ]
                                ],
                                'aggregations'=>[
                                    'ipcount'=>[
                                        'cardinality'=>[
                                            'field'=>'jsoncontent.guid.raw'
                                        ]
                                    ]
                                ]
                            ],
                            'robot_ipcount'=>[
                                'filter'=>[
                                    'term'=>[
                                        'jsoncontent.os.raw'=>'3'
                                    ]
                                ],
                                'aggregations'=>[
                                    'ipcount'=>[
                                        'cardinality'=>[
                                            'field'=>'jsoncontent.guid.raw'
                                        ]
                                    ]
                                ]
                            ],
                            'pc_ipcount'=>[
                                'filter'=>[
                                    'term'=>[
                                        'jsoncontent.os.raw'=>'4'
                                    ]
                                ],
                                'aggregations'=>[
                                    'ipcount'=>[
                                        'cardinality'=>[
                                            'field'=>'jsoncontent.guid.raw'
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ];

                if ($this->channel) {
                    $params['body']['query']['bool']['filter'][]['term']['jsoncontent.platfrom.raw']=$this->channel;
                }

                $results[$date]=$this->esc->search($params);
            }

            // 数据系列
            $series=array();
            foreach ($legend as $key=>$vol) {
                $tmp=array();
                foreach ($this->option['xAxis']['data'] as $date) {
                    $tmp[]=($key!=='all_ipcount') ? $results[$date]['aggregations'][$key]['ipcount']['value'] : $results[$date]['aggregations']['all_ipcount']['value'];
                }
                $series[]=array(
                    'name'	=> $vol,
                    'type'	=> 'line',
                    'data'	=> $tmp
                );
            }

            $this->option['series']=$series;
            $this->ajaxReturn($this->option);
        }else{
            $this->breadcrumb[]=array(
                'text'  =>'登录报表'
            );
            $this->assign('breadcrumb', $this->breadcrumb);
            $this->display();
        }
    }
}