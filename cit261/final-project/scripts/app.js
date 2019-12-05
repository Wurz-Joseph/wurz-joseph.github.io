import Question from './questions.js';
import Quiz from './quiz_controller.js';

onload = async function getQuiz() {
    const response = await fetch("https://opentdb.com/api.php?amount=6&category=18&type=multiple");
    const data = await response.json();

    let questionText = [];
    let answer = [];
    let choices = [];



    for (let i = 0; i < data.results.length; i++) {
        questionText.push(data.results[i].question);
        answer.push(data.results[i].correct_answer);
    }

    for (let i = 0; i < data.results.length; i++) {
        for (let j = 0; j < data.results[i].incorrect_answers.length; j++) {
            choices.push(data.results[i].incorrect_answers[j]);
        }
    }

    function populate() {
        if (quiz.isEnded()) {
            showScores();
        }
        else {
            //show question
            let element = document.getElementById('question');
            element.innerHTML = quiz.getQuestionIndex().text;

            //show choices
            let choices = quiz.getQuestionIndex().choices;
            for (let i = 0; i < choices.length; i++) {
                let element = document.getElementById('choice' + i);
                element.innerHTML = choices[i];
                guess("btn" + i, choices[i]);
            }
            showProgress();
        }
    }

    function guess(id, guess) {
        let button = document.getElementById(id);

        button.onclick = function () {
            quiz.guess(guess);
            populate();
        };
    }

    function showProgress() {
        let currentNumber = quiz.questionIndex + 1;
        let element = document.getElementById('progress');
        element.innerHTML = "Question " + currentNumber + " of " + quiz.questions.length;
    }

    //if quiz has ended show scores page
    function showScores() {
        let gameOverHtml = "<h1>Results</h1>";
        //calc grade
        let grade = Math.round((quiz.score / quiz.questions.length) * 100);

        if (localStorage.getItem("grade") == null) {
            gameOverHtml += "<h2 class='score'>Your Score: " + grade + "%</h2>";
        }
        else {
            gameOverHtml += "<h2 class='score'>Your Score: " + grade + "%</h2>";
            gameOverHtml += "<h2 class='score'>Previous Attempt: " + localStorage.getItem("grade") + "%</h2>";
        }

        //show correct answers
        for (let i = 0; i < answer.length; i++) {
            gameOverHtml += "<p class=answers>Question" + (i + 1) + ": " + answer[i] + "</p>";
        }

        // 1. Create restart button
        let button = document.createElement("button");
        button.innerHTML = "Play Again";
        button.classList.add('btn');

        // 2. Append to div
        let body = document.getElementsByTagName("div")[0];
        body.appendChild(button);

        // 3. Add event handler
        button.addEventListener("click", function () {
            location.reload();
        });

        let element = document.getElementById('quiz');
        element.innerHTML = gameOverHtml;
        //store quiz grade in local storage
        localStorage.setItem("grade", grade);
    }

    let questions = [
        new Question(questionText[0], [choices[0], answer[0], choices[1], choices[2]], answer[0]),
        new Question(questionText[1], [choices[5], choices[3], choices[4], answer[1]], answer[1]),
        new Question(questionText[2], [answer[2], choices[6], choices[8], choices[7]], answer[2]),
        new Question(questionText[3], [choices[9], answer[3], choices[11], choices[10]], answer[3]),
        new Question(questionText[4], [choices[12], answer[4], choices[14], choices[13]], answer[4]),
        new Question(questionText[5], [choices[15], choices[16], answer[5], choices[17]], answer[5])
    ];

    let quiz = new Quiz(questions);
    populate();
}