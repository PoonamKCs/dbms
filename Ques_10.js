var http = require('http');

http.createServer((req,res)=>{
	res.write("Hello World, 'This is my Node.js server'");
	res.end();
})
.listen(10000,()=>
console.log("Congratulation!!! Server Started At Port Number 10000"));