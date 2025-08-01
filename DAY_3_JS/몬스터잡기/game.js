const gameArea = document.getElementById("game-area");
const scoreDisplay = document.getElementById("score");
const timerDisplay = document.getElementById("timer");

let score = 0;
let timeLeft = 10;
let gameInterval;

function createMonster() {
  const monster = document.createElement("div");
  monster.classList.add("monster");

  const x = Math.random() * (gameArea.clientWidth - 50);
  const y = Math.random() * (gameArea.clientHeight - 50);
  monster.style.left = `${x}px`;
  monster.style.top = `${y}px`;

  monster.onclick = function () {
    score++;
    scoreDisplay.innerText = `점수: ${score}`;
    gameArea.removeChild(monster);
  };

  gameArea.appendChild(monster);
}

function startGame() {
  score = 0;
  timeLeft = 10;
  scoreDisplay.innerText = "점수: 0";
  timerDisplay.innerText = "남은 시간: 10초";
  gameArea.innerHTML = "";

  gameInterval = setInterval(() => {
    if (timeLeft <= 0) {
      clearInterval(gameInterval);
      endGame();
    } else {
      timeLeft--;
      timerDisplay.innerText = `남은 시간: ${timeLeft}초`;

      for (let i = 0; i < 3; i++) {
        createMonster();
      }

      while (gameArea.childNodes.length > 10) {
        gameArea.removeChild(gameArea.firstChild);
      }
    }
  }, 1000);
}

function endGame() {
  gameArea.innerHTML = "";
  alert(`게임 종료!\n총 ${score}마리의 몬스터를 잡았습니다.\n${score >= 10 ? "승리!" : "😢 패배!"}`);
}
