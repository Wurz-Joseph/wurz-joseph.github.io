const url = "https://opentdb.com/api.php?amount=10&category=21&type=multiple";

async function getQuiz(){
    const response = await fetch(url)
    const data = await response.json();
    
    //loop to get question and store in localStorage
    for(let i = 0; i < data.results.length; i++){
        localStorage.setItem("q" + (i + 1), data.results[i].question);
    }

    //loop to get correct answer and store in localStorage
    for (let i = 0; i < data.results.length; i++){
        localStorage.setItem("q" + (i + 1) + "Correct", data.results[i].correct_answer)
    }

    for (let i = 0; i < data.results.length; i++){
        for (let j = 0; j < data.results[i].incorrect_answers.length; j++){
            localStorage.setItem("q" + (i + 1) + "Wrong" + (j + 1), data.results[i].incorrect_answers[j]);
        }
    }

}




