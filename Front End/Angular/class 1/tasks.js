function area(a, b, c) {
    var p = (a + b + c) / 2;
    if (isValidTriangle(a, b, c)) {
        return Math.sqrt(p * (p - a) * (p - b) * (p - c));
    } else {
        alert('Imposible triangle');
        return undefined;
    }
}

function isValidTriangle(a, b, c) {
    var p = (a + b + c) / 2;
    return (p * (p - a) * (p - b) * (p - c)) > 0;
}

function celsiusToFerenheit(c) {
    return (c * (9 / 5) + 32);
}

console.log(area(5, 6, 7));