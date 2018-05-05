console.log('Promise started');
let myPromise = new Promise(function(resolve, reject) {
    console.log('Async code started');

    console.log(new Date());
    setTimeout(function(){
       // resolve the promise
       console.log(new Date());
       resolve('Here is the response');
    }, Math.random()*2000 + 1000);
});
console.log('Promise finished');
myPromise.then((responseFromPromise) => {
   console.log('Response: ' + responseFromPromise);
});
console.log('After Promise call');
