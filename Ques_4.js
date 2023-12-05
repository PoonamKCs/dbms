function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i <6; i++) {
      color += letters[Math.floor(Math.random()*16)];
    }
  return color;
}
var table = document.getElementById('t1');
var number = 2;
var interval = setInterval(print_tables,5000);
function print_tables(){
  if (number == 10) 
  {
    clearInterval(interval);
  }
  var result = "";
  for(var i = 1; i<= 10; i++){
    result = result + "<td>"+ number + "*" + i + "=" + number * i+"</td>";
  }
  number++;
  var row = document.createElement('tr');
  row.style.color= getRandomColor();
  row.style.fontSize = (number+12)+"px";
  row.innerHTML=result;
  table.append(row);
}