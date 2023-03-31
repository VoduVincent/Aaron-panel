const http = require('http');
const fs = require('fs').promises
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const hostname = '127.0.0.1';
const port = 3000;

let index;



async function loadHTML(){
  index = await fs.readFile("./Server/index.html")
}


async function tick(){
  const entire_db = await prisma.$queryRawUnsafe`SELECT * FROM YEAR`
  console.log(entire_db)
}
loadHTML()

const server = http.createServer((req, res) => {
  if(req.method == "POST"){
    console.log("Starting Tick")
    tick()
  }
  else{
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html');
    res.writeHead(200);
    res.end(index);
  }
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
