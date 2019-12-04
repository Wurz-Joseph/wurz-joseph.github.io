const startButton = document.getElementById('start-btn');
const nextButton = document.getElementById('next-btn');
const restartButton = document.getElementById('restart-btn');
const newQuizButton = document.getElementById('new-quiz');
const questionContainerElement = document.getElementById('question-container');
const questionElement = document.getElementById('question');
const answerButtons1 = document.getElementById('answer-buttons1');
const answerButtons2 = document.getElementById('answer-buttons2');
const answerButtons3 = document.getElementById('answer-buttons3');
const answerButtons4 = document.getElementById('answer-buttons4');
const answerButtons5 = document.getElementById('answer-buttons5');

let questionIndex;
let questions = [];
let correctAnswer = [];
let incorrectAnswers = {};
// let q1Wrong = [];
// let q2Wrong = [];
// let q3Wrong = [];
// let q4Wrong = [];
// let q5Wrong = [];
/********************API Call*****************/

onload = async function getQuiz() {
    const response = await fetch("https://opentdb.com/api.php?amount=5&category=21&type=multiple");
    const data = await response.json();

    for (let i = 0; i < data.results.length; i++) {
        questions.push(data.results[i].question);
        correctAnswer.push(data.results[i].correct_answer);
        for(let j=0; j < data.results[i].incorrect_answers.length; j++){
            incorrectAnswers[i]["question" + i] = data.results[i].incorrect_answers;
        }
        
    }
    //store the wrong answers in variables
    // q1Wrong.push(data.results[0].incorrect_answers);
    // q2Wrong.push(data.results[1].incorrect_answers);
    // q3Wrong.push(data.results[2].incorrect_answers);
    // q4Wrong.push(data.results[3].incorrect_answers);
    // q5Wrong.push(data.results[4].incorrect_answers);

}

function startQuiz() {
    questionIndex = 0;
    questionElement.innerHTML = questions[questionIndex];
    questionContainerElement.classList.remove('hide');
    startButton.classList.add('hide');
    nextButton.classList.remove('hide');
    restartButton.classList.add('hide');
    newQuizButton.classList.add('hide');
}

function setNextQuestion() {
    questionIndex++;

    if (questionIndex + 1 > questions.length) {
        nextButton.classList.add('hide');
        restartButton.classList.remove('hide');
        newQuizButton.classList.remove('hide');
    } else {
        questionElement.innerHTML = questions[questionIndex];
    }
}

function newQuiz() {
    location.reload();
}



