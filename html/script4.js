//class

class student {
    constructor(number,name,sorce){
        this.number =number;
        this.name =name;
        this.sorce =sorce;
    }
}

var student1 = new student("s08210026","許永紳","80");
document.write(student1.name);


var h1 = document.getElementById("jkl");
console.log(h1);


var link = document.getElementById("link");
console.log(link);
link.href = "file:///C:/Users/jason/OneDrive/%E6%A1%8C%E9%9D%A2/html/page2.html";