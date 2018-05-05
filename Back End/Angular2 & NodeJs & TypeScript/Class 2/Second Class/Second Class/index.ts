
class Person {
  me:string;
  sname:string;

  constructor(sname:string, name:string = "DEJAN") {
    this.me = name;
    this.sname = sname;
  }

  printMyName():string {
    return this.me;
  }

  concat(...args):string {
    let len = args.length;
    let s = "";
    for(var i = 0; i < len; i++) {
      s+=args[i];
    }
    return s;
  }
}

let dejan = new Person("Mladenovski");
console.log(dejan.printMyName());
console.log(dejan.concat(1,2,3));
