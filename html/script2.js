var password = 123456;
var input;
var times=0;
while(password!=input && times<3){

    input=prompt("請輸入密碼");
times++;
if(times==3) {
alert("輸入錯誤次數過多");
}

}

if(times<3) {
alert("welcome");
}