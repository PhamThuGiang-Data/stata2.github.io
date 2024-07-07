*****************************VIỆT NAM********************
use "D:\Đánh giá tác động\Data\data gốc\Vietnam-2005-2009-2015-panel-data- (1)\Vietnam_2005_2009_2015.dta"
*giữ lại các biến cần dùng
keep idstd2015 idstd2009 year panel  d2 n2e n2b n7a n2a _2015_a4b _2009_2005_a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*xử lí về ngành nghề kinh doanh công ty
replace _2015_a4b=0 if _2015_a4b==.
replace  _2009_2005_a4b =0 if  _2009_2005_a4b==.
gen industry =_2015_a4b+ _2009_2005_a4b
*rename các biến và chia các biến cho 10^6
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd2015 year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "VietNam"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2009-2005)+(2015-2009))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
rename idstd2015 panelid
rename idstd2009 idstd
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_VN.dta"

***********************UZEBEKISTAN************
use "D:\Đánh giá tác động\Data\Asia\Uzbekistan_2008_2013_2019.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Uzbekistan"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2009-2005)+(2015-2009))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TPF_Uzbekistan.dta"



*************************Thổ Nhĩ Kỳ*******************
use "D:\Đánh giá tác động\Data\Asia\Turkey_2008_2013_2019.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Turkey"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2013-2008)+(2019-2018))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Turkey.dta"

****************Nga****************
use "D:\Đánh giá tác động\Data\Asia\Russia_2009_2012_2019.dta", clear
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Russia"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2012-2009)+(2019-2012))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Russia.dta"

*******************************Mongolia*******************************
use "D:\Đánh giá tác động\Data\Asia\Mongolia_2009_2013_2019.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a _2009_2013_a4b _2019_a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*xử lí về ngành nghề kinh doanh công ty
replace _2009_2013_a4b=0 if _2009_2013_a4b==.
replace _2019_a4b=0 if _2019_a4b==.
gen industry =_2009_2013_a4b+ _2019_a4b 
*rename các biến và chia các biến cho 10^6
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Mongolia"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2013-2009)+(2019-2013))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd year panel panelid contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Mongolia.dta"



***********************Tajikistan*****************************************
use "D:\Đánh giá tác động\Data\Asia\Tajikistan_2008_2013_2019.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Tajikistan"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2013-2008)+(2019-2013))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Tajikistan.dta"



***********************Azerbaijan*****************************************
use "D:\Đánh giá tác động\Data\Asia\Azerbaijan_2009_2013_2019.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)


***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Azerbaijan"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2013-2009)+(2019-2013))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Azerbaijan.dta"



***********************Armenia*****************************************
use "D:\Đánh giá tác động\Data\Asia\Armenia_2002_2005_2009.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Armenia"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2005-2002)+(2009-2005))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Armenia(1).dta"

use "D:\Đánh giá tác động\Data\Asia\Armenia_2009_2013_2019.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Armenia"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((20013-2009)+(2019-2013))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Armenia(2).dta"


****************************Kazakhtan***********************
use "D:\Đánh giá tác động\Data\Asia\Kazakhstan_2009_2013_2019.dta"
keep idstd panelid year panel d2 n2e n2b n7a n2a a4b j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
**TÍNH TFP**
*giữ lại các công ty có dữ liệu trong vòng 3 năm
keep if panel == 6
*rename các biến và chia các biến cho 10^6
ren a4b industry
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset idstd year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Kazakhstan"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((20013-2009)+(2019-2013))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Kazakhtan.dta"


****************************Lao PDR***********************
use "D:\Đánh giá tác động\Data\Asia\Lao_2009_2013_2019.dta"
egen count_panel = count( panelid ), by( panelid )
keep if count_panel==3
*xử lí về ngành nghề kinh doanh công ty
replace _2012_2016_2018_a4b =0 if _2012_2016_2018_a4b ==.
replace _2009_a4b =0 if _2009_a4b ==.
gen industry = _2012_2016_2018_a4b + _2009_a4b
*rename các biến và giữ lại các biến cần dùng
rename _2012_2016_2018_l3a l3a
rename _2012_2016_2018_l3b l3b
rename _2012_2016_l4a l4a
rename _2012_2016_2018_l4b l4b
rename _2016_2018_e1 e1
keep idstd panelid year panel  d2 n2e n2b n7a n2a industry j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
*rename các biến và chia các biến cho 10^6
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset panelid year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "LaoPDR"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2009-2005)+(2015-2009))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_LaoPDR.dta"

****************************West Bank and Gaza***********************
use "D:\Đánh giá tác động\Data\Asia\West Bank and Gaza_2006_2013_2019.dta"
egen count_panel = count( panelid ), by( panelid )
keep if count_panel==3
*xử lí về ngành nghề kinh doanh công ty
gen industry = _2013_2019_a4b
 gen lagIndus = industry[_n+1]
replace industry = lagIndus if year==2006
*rename các biến và giữ lại các biến cần dùng
rename _2013_2019_n2e n2e
rename _2013_2019_n2b n2b
rename _2013_2019_n2a n2a
rename _2013_2019_j6a j6a
rename _2013_2019_l3a l3a
rename _2013_2019_l3b l3b
rename _2013_2019_l4a1 l4a
rename _2013_2019_l4b l4b
rename _2013_2019_e1 e1
keep idstd panelid year panel  d2 n2e n2b n7a n2a industry j6a j30f j30e l3a l3b l4a l4b b7 b5 e1 b2b
*rename các biến và chia các biến cho 10^6
ren d2 output
ren n2e input
ren n2b energy
ren n7a capital
ren n2a labour
gen valueadded = output - input
replace valueadded = valueadded/1000000
replace labour = labour/1000000
replace capital = capital/1000000
replace energy = energy/1000000
gen material = input
replace material = material/1000000
*loại bỏ biến missing và biến don't know
replace output =0.02 if output==0|output==.|output < 0
replace input =0.01 if input==0|input==.|input < 0
replace valueadded =0.01 if valueadded==0|valueadded==.|valueadded < 0
replace labour =0.01 if labour==0|labour==.|labour < 0
replace capital =0.01 if capital==0|capital==.|capital < 0
replace energy =0.01 if energy==0|energy==.|energy < 0
gen ln_valueadded = ln(valueadded)
gen ln_labour = ln(labour)
gen ln_capital = ln(capital)
gen ln_energy = ln(energy)
gen ln_material = ln(material)
xtset panelid year
prodest ln_valueadded, method(lp) free( ln_labour) proxy( ln_energy) state(ln_capital) control(industry) valueadded fsresiduals(resid)

***XỬ LÍ CÁC BIẾN KHÁC***
*tạo biến region
gen region = "Gaza"
**xử lí biến corruption**
*xử lí các giá trị không phải từ 0 đến 4
tab j30f
replace j30f = 0.01 if j30f ==.| j30f<0
tab j30e
replace j30e = 0.01 if j30e ==.| j30e<0
*tạo biến corruption
gen corruption = (j30e+j30f)/2
replace corruption=corruption/4
**Xử lí biến worker**
replace l3a =0 if l3a ==.|l3a<0
replace l3b =0 if l3b ==.|l3b<0
replace l4a =0 if l4a ==.|l4a<0
replace l4b =0 if l4b ==.|l4b<0
gen wokers= l3a+l3b+l4a+l4b
replace wokers = 0.01 if wokers ==0
**Xử lí biến elapsed time**
gen elapsed_time = ((2009-2005)+(2015-2009))/2
**xử lí biến firm_age**
gen firm_age=2024-b5
replace firm_age=0.01 if firm_age==.
**xử lí các biến còn lại
*rename các biến
ren j6a contract
ren b7 manager_experience
ren b2b foreign_ownership
*SAVE
keep idstd panelid year panel contract corruption resid elapsed_time wokers manager_experience firm_age foreign_ownership region e1
save "D:\Đánh giá tác động\Data\TFP\TFP_Gaza.dta"

************APPEND*******************************
append using "D:\Đánh giá tác động\Data\TFP\TFP_Russia.dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_Armenia(1).dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_Armenia(2).dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_Azerbaijan.dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_Tajikistan.dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_Mongolia.dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_Turkey.dta"
append using "D:\Đánh giá tác động\Data\TFP\TPF_Uzbekistan.dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_VN.dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_LaoPDR.dta"
append using "D:\Đánh giá tác động\Data\TFP\TFP_Gaza.dta"
save "D:\Đánh giá tác động\Data\databanchinh.dta"

*******************CHẠY MÔ HÌNH HỒI QUY**********************************
replace contract=0 if contract==.| contract==2| contract==-9
replace foreign_ownership=0 if foreign_ownership<0
replace manager_experience =0 if manager_experience <0
label define J6A 1 "Yes" 0 "No", replace
****
replace resid=0 if resid==.
gen TFP_2= resid*resid
gen corruption_TFP= corruption*resid
gen corruption_TFP2= corruption*TFP_2
* Tạo biến giả e1(n+1) và từ đây điền full dữ liệu cho e1 để được biến tình trạng xuất khẩu
* e1=1 tương ứng với công ty hướng tới thị trường nội địa
* e1=2 tương ứng với công ty có hoạt động xuất khẩu
* e1=3 tương ứng với công ty quốc tế
gen e1_a = e1[_n+1]
replace e1= e1_a if e1==9| e1==.
replace e1=3 if e1==. & foreign_ownership>90
replace e1=2 if e1==. & foreign_ownership>0
replace e1=1 if e1==. & foreign_ownership==0
replace e1=1 if e1==4|e1==-9
drop e1_a
* Tạo biến tình trạng xuất khẩu
gen Export_status= 0 if e1==1
replace Export_status=1 if Export_status==.
label variable Export_status "Exporting status"
label values Export_status Export
label define Export 0 "DOMESTIC-MARKET ORIENTED FIRMS" 1 "INTERNATIONAL FIRMS", replace

* Đổi tên biến resid thành TFP 
rename resid TFP 

* Bảng 1: Thống kê mô tả theo tình trạng xuất khẩu
asdoc bysort Export_status: sum contract corruption TFP foreign_ownership manager_experience wokers firm_age

* Bảng 2: Đồ thị tương quan giữa các biến
asdoc pwcorr contract corruption TFP foreign_ownership manager_experience wokers elapsed_time firm_age , star(0.05) title(Table 2: Correlate) save(TFPandCor)

* Bảng 3: Hồi quy
* Hồi quy với thị trường hướng nội địa
asdoc logistic contract corruption TFP firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==0, replace nest dec(4) save(TFP_Corruption) title(Table 3)

asdoc logistic contract corruption TFP corruption_TFP firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==0, append nest dec(4) save(TFP_Corruption) title(Table 3)

asdoc logistic contract corruption TFP TFP_2 firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==0, append nest dec(4) save(TFP_Corruption) title(Table 3)

asdoc logistic contract corruption TFP TFP_2 corruption_TFP corruption_TFP2 firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==0, append nest dec(4) save(TFP_Corruption) title(Table 3)

* Hồi quy với thị trường hướng quốc tế

asdoc logistic contract corruption TFP firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==1, append nest dec(4) save(TFP_Corruption) title(Table 3)

asdoc logistic contract corruption TFP corruption_TFP firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==1, append nest dec(4) save(TFP_Corruption) title(Table 3)

asdoc logistic contract corruption TFP TFP_2 firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==1, append nest dec(4) save(TFP_Corruption) title(Table 3)

asdoc logistic contract corruption TFP TFP_2 corruption_TFP corruption_TFP2 firm_age elapsed_time wokers manager_experience foreign_ownership if Export_status==1, append nest dec(4) save(TFP_Corruption) title(Table 3)

*Tạo biến mức độ tham nhũng theo 4 cấp độ
gen Corr_status=4 if corruption < 0.22
replace Corr_status=3 if corruption< 0.45 & Corr_status==.
replace Corr_status=2 if corruption< 0.57 & Corr_status==.
replace Corr_status=1 if Corr_status==.
order Nation panelid year contract corruption Corr_status TFP

*Đổi label cho Corr_Status
label variable Corr_status "Corruption Status"
label define Corr_Status 1 "very high corruption" 2 "moderately high corruption" 3 "moderately low corruption" 4 "very low corruption"
label values Corr_status Corr_Status
* Hồi quy và dự báo giá trị 
logistic contract corruption TFP TFP_2 corruption_TFP corruption_TFP2 firm_age elapsed_time wokers manager_experience foreign_ownership
predict P, xb
* Tạo biến xác suất đạt được hợp đồng chính phủ 
gen X= exp(P)/(1+ exp(P))
* Tạo 4 biến xác suất đạt đươc hợp đồng chính phủ theo từng mức độ tham nhũng
gen Very_Low_Corruption = X if Corr_status==4
gen Low_Corruption= X if Corr_status==3
gen High_Corruption= X if Corr_status==2
gen Very_High_Corruption= X if Corr_status==1
sum 
* Vẽ đồ thị tương tác giữa TFP và xác suất đạt hợp đồng chính phủ theo từng mức độ tham nhũng
twoway lowess Very_Low_Corruption TFP || lowess Low_Corruption TFP || lowess High_Corruption TFP || lowess Very_High_Corruption TFP, by(Export_status) scheme(stmono)



