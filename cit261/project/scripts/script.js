
const startButton = document.getElementById('start-btn');
const nextButton = document.getElementById('next-btn');
const questionContainerElement = document.getElementById('question-container');
const questionElement = document.getElementById('question');
const answerButtonsElement = document.getElementById('answer-buttons');

let shuffledQuestions, currentQuestionIndex;


startButton.addEventListener('click', startGame)
nextButton.addEventListener('click', () => {
    currentQuestionIndex++;
    setNextQuestion();

})

function startGame() {
    getQuiz();
    startButton.classList.add('hide');
    shuffledQuestions = questions.sort(() => Math.random() - .5);
    
    

    currentQuestionIndex = 0;
    questionContainerElement.classList.remove('hide');
    setNextQuestion();
}

function setNextQuestion() {
    resetState();
    showQuestion(shuffledQuestions[currentQuestionIndex]);

}

function showQuestion(question) {
    questionElement.innerHTML = question.question;
    question.answers.forEach(answer => {
        const button = document.createElement('button');
        button.innerHTML = answer.text;
        button.classList.add('btn');
        if (answer.correct) {
            button.dataset.correct = answer.correct;
        }
        button.addEventListener('click', selectAnswer);
        answerButtonsElement.appendChild(button);
    })
}

function resetState() {
    clearStatusClass(document.body);
    nextButton.classList.add('hide');

    while (answerButtonsElement.firstChild) {
        answerButtonsElement.removeChild(answerButtonsElement.firstChild);
    }
}

function selectAnswer(e) {
    const selectedButton = e.target;
    const correct = selectedButton.dataset.correct;
    setStatusClass(document.body, correct);
    Array.from(answerButtonsElement.children).forEach(button => {
        setStatusClass(button, button.dataset.correct)
    })
    if (shuffledQuestions.length > currentQuestionIndex + 1) {
        nextButton.classList.remove('hide');
    } else {
        startButton.innerText = 'Take Another Quiz';
        startButton.classList.remove('hide');
    }
}

function setStatusClass(element, correct) {
    clearStatusClass(element);
    if (correct) {
        element.classList.add('correct');

    } else {
        element.classList.add('wrong');
    }
    
}

function clearStatusClass(element) {
    element.classList.remove('correct');
    element.classList.remove('wrong');
}

//Trivia Questions

const questions = [
    {
        question: localStorage.getItem('q1'),
        answers: [
            { text: localStorage.getItem('q1Wrong1'), correct: false },
            { text: localStorage.getItem('q1Correct'), correct: true },
            { text: localStorage.getItem('q1Wrong2'), correct: false },
            { text: localStorage.getItem('q1Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q2'),
        answers: [
            { text: localStorage.getItem('q2Wrong1'), correct: false},
            { text: localStorage.getItem('q2Correct'), correct: true },
            { text: localStorage.getItem('q2Wrong2'), correct: false },
            { text: localStorage.getItem('q2Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q3'),
        answers: [
            { text: localStorage.getItem('q3Wrong1'), correct: false },
            { text: localStorage.getItem('q3Wrong2'), correct: false },
            { text: localStorage.getItem('q3Correct'), correct: true },
            { text: localStorage.getItem('q3Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q4'),
        answers: [
            { text: localStorage.getItem('q4Correct'), correct: true },
            { text: localStorage.getItem('q4Wrong1'), correct: false },
            { text: localStorage.getItem('q4Wrong2'), correct: false },
            { text: localStorage.getItem('q4Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q5'),
        answers: [
            { text: localStorage.getItem('q5Correct'), correct: true },
            { text: localStorage.getItem('q5Wrong1'), correct: false },
            { text: localStorage.getItem('q5Wrong2'), correct: false },
            { text: localStorage.getItem('q5Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q6'),
        answers: [
            { text: localStorage.getItem('q6Wrong1'), correct: false },
            { text: localStorage.getItem('q6Wrong2'), correct: false },
            { text: localStorage.getItem('q6Correct'), correct: true },
            { text: localStorage.getItem('q6Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q7'),
        answers: [
            { text: localStorage.getItem('q7Wrong1'), correct: false },
            { text: localStorage.getItem('q7Correct'), correct: true },
            { text: localStorage.getItem('q7Wrong2'), correct: false },
            { text: localStorage.getItem('q7Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q8'),
        answers: [
            { text: localStorage.getItem('q8Wrong1'), correct: false },
            { text: localStorage.getItem('q8Correct'), correct: true },
            { text: localStorage.getItem('q8Wrong2'), correct: false },
            { text: localStorage.getItem('q8Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q9'),
        answers: [
            { text: localStorage.getItem('q9Wrong1'), correct: false },
            { text: localStorage.getItem('q9Correct'), correct: true },
            { text: localStorage.getItem('q9Wrong2'), correct: false },
            { text: localStorage.getItem('q9Wrong3'), correct: false }
        ]
    },
    {
        question: localStorage.getItem('q10'),
        answers: [
            { text: localStorage.getItem('q10Wrong1'), correct: false },
            { text: localStorage.getItem('q10Wrong2'), correct: false },
            { text: localStorage.getItem('q10Wrong3'), correct: false},
            { text: localStorage.getItem('q10Correct'), correct: true }
        ]
    }
]