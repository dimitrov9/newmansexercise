var Person = (function () {
    function Person(sname, name) {
        if (name === void 0) { name = "DEJAN"; }
        this.me = name;
        this.sname = sname;
    }
    Person.prototype.printMyName = function () {
        return this.me;
    };
    Person.prototype.concat = function () {
        var args = [];
        for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
        }
        var len = args.length;
        var s = "";
        for (var i = 0; i < len; i++) {
            s += args[i];
        }
        return s;
    };
    return Person;
}());
var dejan = new Person("Mladenovski");
console.log(dejan.printMyName());
console.log(dejan.concat(1, 2, 3));
//# sourceMappingURL=index.js.map