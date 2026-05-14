const fs = require('fs');

try {
    const key = process.argv[2];
    let dx = 0, dy = 0;

    if (key === 'w') dy = -1;
    if (key === 's') dy = 1;
    if (key === 'a') dx = -1;
    if (key === 'd') dx = 1;

    // Direct atomic sync write to communicate with the C++ input pipeline
    fs.writeFileSync('movement.txt', `${dx} ${dy}`);
    process.exit(0);
} catch (err) {
    process.stderr.write(err.message);
    process.exit(1);
}
