var Lesson1 = (function () {
    function Lesson1() {
    }
    Lesson1.prototype.perimetar = function () {
        return 5 + 6 + 7;
    };
    Lesson1.prototype.canBeTriangle = function (a, b, c) {
        return (((a + b) > c) && ((b + c) > a) && ((a + c) > b))
            ? true
            : false;
    };
    Lesson1.prototype.toFarenheit = function (c) {
        return c * 1.8 + 32;
    };
    return Lesson1;
}());
var lessonObject = new Lesson1();
console.log(lessonObject.canBeTriangle(3, 4, 5));
console.log(lessonObject.toFarenheit(-10));
//# sourceMappingURL=lesson1.js.map