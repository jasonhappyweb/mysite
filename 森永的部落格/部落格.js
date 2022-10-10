

var title=document.getElementById("title");
var p1=document.getElementById("p1");
var btn=document.getElementById("btn");
var list=document.getElementById("list");

btn.addEventListener("click",function(){
list.innerHTML = list.innerHTML + `
<div class="article">
            <h1 style="margin-left: 100px;"> ${title.value} </h1>
            <p>${p1.value}</p>
            <hr>
            </div>`;
            title.value="";
            p1.value="";
})