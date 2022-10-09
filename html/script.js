//資料基本型態&變數


//字串
"dsfa"

//數字
87
160
160.555

//布林值

true
false


var a="有一個人叫永森";
var age =23;
document.write(a);
document.write("<br/>")

document.write("他今年"+age+"歲");
document.write("<br/>");
var a1="12345678";
var a2="12345";
document.write("年紀"+a1 + "年紀"+b1);

//這裡就是要傳入一個值 name
document.write("<br/>");
function hello(name1){
    document.write("你好"+name1);
}

hello("jason");

function add(num1,num2){

    return num1+num2;
}
p=add(3,6);

document.write(p);

if(a1=="12345678" && b1=="12345") {
document.write("恭喜輸入正確");
}
else {

document.write("輸入錯誤"+"<br/>");

}

var me ={
    title:"我是許永珅",
    age1:"23",
    department:"資工系",
    住址:"新興路53巷12號"

}

document.write(me.title);