//base class
class User {

    constructor(fName, lName, username) {
        this.fName = fName;
        this.lName = lName;
        this.username = username;
    }

    //method to generate email depending on object properties values.
    generateEmail() {
        let email = this.fName + '.' + this.lName + '@byu.edu';
        console.log('The email for ' + this.fName + ' is ' + email);
        return email;
    }
}


//Student is a subclass of User
class Student extends User {

    constructor(fName, lName, username, iNumber) {
        super(fName, lName, username);
        this.iNumber = iNumber;
    }

}

//instantiate new objects
let user1 = new User('tom', 'brady', 'tb12');
let student1 = new Student('joseph', 'wurz', 'jwurz', 11111111);
let student2 = new Student('paul', 'bunyan', 'pbuns', 63636363);

