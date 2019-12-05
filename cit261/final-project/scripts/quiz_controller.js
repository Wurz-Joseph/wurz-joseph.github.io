export default class Quiz {
    constructor(questions) {
        this.score = 0;
        this.questions = questions;
        this.questionIndex = 0;
    }
    getQuestionIndex() {
        return this.questions[this.questionIndex];
    }

    isEnded() {
        return this.questions.length == this.questionIndex;
    }

    guess(answer) {
        if (this.getQuestionIndex().correctAnswer(answer)) {
            this.score++;
            let header = document.getElementById('header');
            header.style.backgroundColor = '#5a8d03';
        }
        else {
            header.style.backgroundColor = '#cc0000';
        }

        this.questionIndex++;
    }

}