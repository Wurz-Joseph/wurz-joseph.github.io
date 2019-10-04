/////////variables/////////
//demostrate variables and scope
//global scope
var saying = "global scope";
function myFunction() {
  //function scope
  var saying = "function scope";
  console.log(saying);
  if (1 == 1) {
    //block scope
    let saying = "block scope"
    console.log(saying);
  }
}
console.log(saying);

///////conditional statements/////
var hour = 7;
if (hour >= 5 && hour <= 11) {
  console.log("good morning!")
} else if (hour >= 12 && hour <= 17) {
  console.log("good afternoon!")
} else console.log("good night!")

///////Switch//////
//pulled directly from w3 schools example
var day;
switch (new Date().getDay()) {
  case 0:
    day = "Sunday";
    break;
  case 1:
    day = "Monday";
    break;
  case 2:
    day = "Tuesday";
    break;
  case 3:
    day = "Wednesday";
    break;
  case 4:
    day = "Thursday";
    break;
  case 5:
    day = "Friday";
    break;
  case 6:
    day = "Saturday";
}
console.log(day);

///////////array///////////

var zooAnimals = ["giraffe", "hippo", "zebra", "lion", "tiger", "bat"];
///////associative array
var student1 = { firstName: "Joseph", lastName: "Wurz", age: 29, grade: 'A' };
var student2 = { firstName: "Tom", lastName: "Brady", age: 42, grade: 'A' };

///////For Loop////////
var text = "";
//for loop that iterates through array of zooAnimals
for (var i = 0; i < zooAnimals.length; i++)
  //log array of animals to the console
  console.log(zooAnimals[i]);

////////While Loop/////////
//initialize to 10
var number = 10;

//loop while number is greater than 0
while (number > 0) {
  console.log("Your spot in line is #" + number);
  number--;
}
//print to console after breaking out of while loop.
console.log("It is your turn! Please come to the front desk.");

////////do while///////
var text = "";
var i = 6;
do {
  console.log(text = "The number is " + i);
  i++
}
while (i < 5);


///////function////////

//function that doesn't have a return
function sendGreeting(name, course) {
  console.log("Hello " + name + ". Welcome to " + course);
}

//function that returns the area
function calculateArea(width, length) {
  return width * length;
}
