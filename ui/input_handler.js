const fs = require('fs');
const key = process.argv[3];
let dx = 0, dy = 0;
if (key === 'w') dy = -1;
if (key === 's') dy = 1;
if (key === 'a') dx = -1;
if (key === 'd') dx = 1; 
fs.writeFileSync('movement.txt', `${dx} ${dy}`);
