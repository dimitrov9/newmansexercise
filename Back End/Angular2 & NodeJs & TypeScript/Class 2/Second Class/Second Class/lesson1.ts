class Lesson1 {
  perimetar():number {
    return 5+6+7;
  }

  canBeTriangle(a:number,b:number,c:number):boolean {
   return (((a+b) > c) && ((b+c) > a) && ((a+c) > b))
     ? true
     : false;
  }

  toFarenheit(c:number): number {
    return c * 1.8 + 32;
  }
}

let lessonObject = new Lesson1();
console.log(lessonObject.canBeTriangle(3,4,5));
console.log(lessonObject.toFarenheit(-10));
