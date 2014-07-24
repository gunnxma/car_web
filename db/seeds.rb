# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
department = Department.create(name: 'admin') if Department.count == 0

User.create(department_id: department.id, name: 'admin', account: 'admin', pwd: 'admin') if User.count == 0

Saletype.create([{ name: '寄售' }, { name: '收购' }, { name: '置换' }]) if Saletype.count == 0

if Newsfrom.count == 0
  Newsfrom.create(name: '来电来访')
  Newsfrom.create(name: '主动来店')
  Newsfrom.create(name: '朋友介绍')
  Newsfrom.create(name: '公司网站')
  Newsfrom.create(name: '报纸广告')
  Newsfrom.create(name: '合作商户')
  Newsfrom.create(name: '老客户介绍')
end

if CooperateType.count == 0
  CooperateType.create(name: '汽车厂商')
  CooperateType.create(name: '4S经销商')
  CooperateType.create(name: '银行')
  CooperateType.create(name: '保险公司')
  CooperateType.create(name: '金融担保公司')
  CooperateType.create(name: '维修汽配厂')
  CooperateType.create(name: '租车公司')
  CooperateType.create(name: '婚庆礼仪公司')
  CooperateType.create(name: '政府单位')
  CooperateType.create(name: '其他')
end

if CooperateRelation.count == 0
  CooperateRelation.create(name: '合作伙伴')
  CooperateRelation.create(name: '供应商')
end

if CooperateLevel.count == 0
  CooperateLevel.create(name: '一级')
  CooperateLevel.create(name: '二级')
  CooperateLevel.create(name: '三级')
end

if Rating.count == 0
  Rating.create(name: '普通车源')
  Rating.create(name: '优质车源')
end

if Transmission.count == 0
  Transmission.create(name: '手自一体')
  Transmission.create(name: '自动')
  Transmission.create(name: '手动')
  Transmission.create(name: '双离合')
end

if CcUnit.count == 0
  CcUnit.create(name: 'L')
  CcUnit.create(name: 'T')
end

if Color.count == 0
  Color.create(name: '黑色', color: '#333333')
  Color.create(name: '红色', color: '#CC0000')
  Color.create(name: '白色', color: '#ffffff')
  Color.create(name: '咖啡色', color: '#F1E9C8')
  Color.create(name: '绿色', color: '#339933')
  Color.create(name: '蓝色', color: '#0066CC')
  Color.create(name: '黄色', color: '#FF9900')
  Color.create(name: '银白色', color: '#F5F5F3')
  Color.create(name: '灰色', color: '#E0E2E2')
  Color.create(name: '棕色', color: '#CC9966')
end

if InteriorColor.count == 0
  InteriorColor.create(name: '黑色', color: '#333333')
  InteriorColor.create(name: '灰色', color: '#CCCCCC')
  InteriorColor.create(name: '浅黄', color: '#F3ECD2')
  InteriorColor.create(name: '棕红', color: '#CC6600')
end

if BodyClass.count == 0
  BodyClass.create(name: '两厢')
  BodyClass.create(name: '三厢')
end

if EmissionStandard.count == 0
  EmissionStandard.create(name: '国2排放(欧2)')
  EmissionStandard.create(name: '国3排放(欧3)')
  EmissionStandard.create(name: '国4排放(欧4)')
  EmissionStandard.create(name: '国5排放(欧5)')
  EmissionStandard.create(name: '其他')
end

if UseNature.count == 0
  UseNature.create(name: '非营运')
  UseNature.create(name: '营运')
  UseNature.create(name: '单位用车')
  UseNature.create(name: '公务车辆')
end

if CompulsoryCompany.count == 0
  CompulsoryCompany.create(name: '平安车险')
  CompulsoryCompany.create(name: '太平洋车险')
end

if BusinessInfo.count == 0
  BusinessInfo.create(name: '车损险')
  BusinessInfo.create(name: '第三者责任险')
  BusinessInfo.create(name: '盗抢险')
  BusinessInfo.create(name: '座位险')
  BusinessInfo.create(name: '玻璃险')
  BusinessInfo.create(name: '划痕险')
  BusinessInfo.create(name: '自燃险')
  BusinessInfo.create(name: '不计免赔险')
end

if BusinessCompany.count == 0
  BusinessCompany.create(name: '平安保险')
  BusinessCompany.create(name: '泰康保险')
end

if Standard.count == 0
  Standard.create(name: '基本型')
  Standard.create(name: '舒适型')
  Standard.create(name: '豪华型')
  Standard.create(name: '最高配置')
end

if Safety.count == 0
  Safety.create(name: 'EBD（制动力分配系统）')
  Safety.create(name: 'ABS（防抱死刹车系统）')
  Safety.create(name: 'ESP（电子稳定装置）')
  Safety.create(name: 'ASR（驱动防滑系统）')
  Safety.create(name: 'EDS（电子差速锁）')
  Safety.create(name: 'TCS（牵引力控制系统）')
  Safety.create(name: '4WD（四轮驱动）')
  Safety.create(name: '安全气囊')
end

if Comfort.count == 0
  Comfort.create(name: '天窗')
  Comfort.create(name: '电动车窗')
  Comfort.create(name: '多功能方向盘')
  Comfort.create(name: '电加热/出风座椅')
  Comfort.create(name: '真皮座椅')
  Comfort.create(name: '恒温空调')
  Comfort.create(name: '电调空调')
  Comfort.create(name: '车载冰箱')
  Comfort.create(name: '车载电话')
  Comfort.create(name: '氙气灯')
  Comfort.create(name: '电视')
  Comfort.create(name: '后排座椅安全带')
end

if Function.count == 0
  Function.create(name: 'MP3')
  Function.create(name: 'DVD')
  Function.create(name: 'CD')
  Function.create(name: 'GPS导航')
  Function.create(name: 'CCS定速巡航')
  Function.create(name: 'X扬声器')
  Function.create(name: '大灯高度可调')
  Function.create(name: '倒车雷达')
  Function.create(name: '倒车影像系统')
  Function.create(name: '助力转向')
  Function.create(name: '行车电脑显示')
  Function.create(name: '防盗设备')
  Function.create(name: '前后盘式刹车')
  Function.create(name: '高位刹车灯')
  Function.create(name: '防炫目后视镜')
  Function.create(name: '铝合金轮毂')
  Function.create(name: '中控锁')
  Function.create(name: '钥匙遥控')
end

if SellWay.count == 0
  SellWay.create(name: '58同城')
  SellWay.create(name: '赶集网')
  SellWay.create(name: '第一车网')
end

if PaymentMethod.count == 0
  PaymentMethod.create(name: '定金')
  PaymentMethod.create(name: '分期')
  PaymentMethod.create(name: '全款')
end

if CustomerSort.count == 0
  CustomerSort.create(name: '求购')
  CustomerSort.create(name: '置换')
  CustomerSort.create(name: '其他')
end

if CallType.count == 0
  CallType.create(name: '公司固话')
  CallType.create(name: '400电话')
  CallType.create(name: '手机')
  CallType.create(name: '微信')
end

if Age.count == 0
  Age.create(name: '20岁以下')
  Age.create(name: '20-25岁')
  Age.create(name: '25-30岁')
  Age.create(name: '30-35岁')
  Age.create(name: '35-40岁')
  Age.create(name: '40-45岁')
  Age.create(name: '45-50岁')
  Age.create(name: '50岁以上')
end

if Industry.count == 0
  Industry.create(name: '金融')
  Industry.create(name: '教育')
  Industry.create(name: '行政')
  Industry.create(name: '互联网')
  Industry.create(name: '体育')
  Industry.create(name: '传媒')
  Industry.create(name: '其他')
end

if Duty.count == 0
  Duty.create(name: '老板')
  Duty.create(name: '经理')
  Duty.create(name: '主管')
  Duty.create(name: '白领')
  Duty.create(name: '个体户')
  Duty.create(name: '其他')
end

if Income.count == 0
  Income.create(name: '5000元以下')
  Income.create(name: '5000-8000元')
  Income.create(name: '8000-10000元')
  Income.create(name: '1万元-1.5万')
  Income.create(name: '1.5万元-2万元')
  Income.create(name: '2万元-10万元')
  Income.create(name: '10万元以上')
end

if CarSort.count == 0
  CarSort.create(name: '轿车')
  CarSort.create(name: '商务车/MPV')
  CarSort.create(name: '越野车/SUV')
  CarSort.create(name: '跑车')
  CarSort.create(name: '其他')
end

if Experience.count == 0
  Experience.create(name: '无购车经验')
  Experience.create(name: '二次购车')
  Experience.create(name: '多次购车')
end

if BuyReason.count == 0
  BuyReason.create(name: '升级换代')
  BuyReason.create(name: '上下班代步')
end

if Network.count == 0
  Network.create(name: '公司网站')
  Network.create(name: '51汽车网')
  Network.create(name: '淘车网')
  Network.create(name: '第一车网')
  Network.create(name: '华夏二手车网')
  Network.create(name: '二手车之家')
  Network.create(name: '其他')
end

if CustomerTag.count == 0
  CustomerTag.create(name: '重点客户')
  CustomerTag.create(name: '意向客户')
  CustomerTag.create(name: '专业客户')
end

if BusinessStage.count == 0
  BusinessStage.create(name: '初步了解')
  BusinessStage.create(name: '潜在客户')
  BusinessStage.create(name: '意向客户')
  BusinessStage.create(name: '谈判阶段')
  BusinessStage.create(name: '成交阶段')
end

if PaymentsWay.count == 0
  PaymentsWay.create(name: '现金')
  PaymentsWay.create(name: '网转')
  PaymentsWay.create(name: '支票')
  PaymentsWay.create(name: '其他')
end

if PayReason.count == 0
  PayReason.create(name: '付收车全款')
  PayReason.create(name: '付收车定金')
  PayReason.create(name: '收车信息费')
  PayReason.create(name: '外联集资款')
  PayReason.create(name: '收购指标费')
  PayReason.create(name: '售外销售提成')
  PayReason.create(name: '置换外找（买收）')
  PayReason.create(name: '过户费')
end

if ProceedsReason.count == 0
  ProceedsReason.create(name: '售车全款')
  ProceedsReason.create(name: '售车定金')
  ProceedsReason.create(name: '售车余款')
  ProceedsReason.create(name: '售车余款补齐')
  ProceedsReason.create(name: '商险收入')
  ProceedsReason.create(name: '补助收入')
  ProceedsReason.create(name: '额外收入')  
  ProceedsReason.create(name: '指标收入')
  ProceedsReason.create(name: '等价置换')
  ProceedsReason.create(name: '置换补余（栋收）')
end

if FollowupType.count == 0
  FollowupType.create(name: '电话沟通')
  FollowupType.create(name: '当面沟通')
  FollowupType.create(name: '邮件联系')
  FollowupType.create(name: '其他方式')
  FollowupType.create(name: '客户回访')
end