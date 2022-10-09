
//2微陣列跟巣狀迴圈

var number =[
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [0],
];


document.write(number[0][2]);

for(var i=0;i<3;i++){
    for(var j=0;j<3;j++){
     document.write(number[i][j]);

    }
}