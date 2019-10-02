//JSON format
var jsonData = '{"fName": "Joseph", "middleInitial": "null", "lName": "Smith", "order": 1, "birthState": "Vermont"}';
//JavaScript Object format
var jsObject = { fName: "Joseph", middleInitial: null, lName: "Smith", order: 1, birthState: "Vermont" };

//use parse to convert from JSON to JavaScript object.
var obj = JSON.parse(jsonData);

console.log(jsonData);
console.log(jsObject);


//document.write("<br>" + obj.fName + " " + obj.lName + " " + "was born in " + obj.birthState);


//use stringify to convert from JavaScript object to JSON format.
var toJson = JSON.stringify(obj);
//log results
console.log(toJson);