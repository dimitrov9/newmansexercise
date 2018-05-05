var printMyName = (name) => {
    console.log(`My name is ${name}`);
}

var printHello2 = () => {
    console.log(`Hello`);
}

var printHello = () => {
    //console.log(`Hello`);
    printHello2();
}



exports.printMyName = printMyName;
exports.printHello = printHello;
