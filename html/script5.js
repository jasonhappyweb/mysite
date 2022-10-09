// event listener
//this代表目前被案的元素

//function asd(element) {
 //   console.log(element);
 //   element.innerText = "案個屁";
//}

//設定按鈕
var btn=document.getElementById("btn");
btn.addEventListener("click",function(){
        this.innerText = "案甚麼";
//alert("你暗暗甚麼");
})

var ls = document.getElementById("ls");

ls.addEventListener("mouseover",function(){
this.src="efg.jfif";

}
)

ls.addEventListener("mouseleave",function(){

    this.src="abc.jpg";
})