var utils = require(`./module_demos.js`);
var fs = require(`fs`);

//-------------------------------------------------
utils.printMyName('Nikola');
utils.printHello();

//-------------------------------------------------
var readFromFile = (fileLocation) => {
    fs.readFile(fileLocation, (err, data) => {
        if (err) console.error(err);
        console.log(data.toString());
    })
}

var writeFile = (fileLocation, data) => {
    fs.writeFileSync(fileLocation, data, (err, succ) => {
        if (err) Console.error(err);
        console.log(`File ${fileLocation} was created with`);
    });

}

var readAndBackup = (source, destination) => {
    if (fs.existsSync(source)) {
        if (fs.existsSync(destination)) {
            console.log("Overwriting file");
        } else {
            console.log("Creating new file");
        }
        var dataToBackup = fs.readFileSync(source);
        fs.writeFileSync(destination, dataToBackup);
    } else {
        console.log("The source file doesn't exits");
    }

}

//-------------------------------------------------
writeFile(`./myFile.txt`, `Hello file`);
readFromFile(`./myFile.txt`);

//----------------------------------------------------
readAndBackup(`./myFile.txt`, `./myFile-backup3.txt`);
