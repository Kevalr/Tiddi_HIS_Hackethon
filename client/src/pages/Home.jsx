import React, { useEffect, useState } from "react";
import Header from "../components/Header";
import Scorecard from "../components/Scorecard";

const Home = () => {
  const [score, setScore] = useState({
    runs: 0,
    wicket: 0,
    over: 0,
    ballNumber: 0,
  });

  //Will store the runs/wicket on each ball of over
  const [over, setOver] = useState([]);

  //Holds the type of balls and shots
  const typesOfBalls = ['yorker', 'bouncer', 'length ball', 'full toss', 'swinging ball', 'abcd'];
  const typesOfShots = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  const [currentBall, setCurrentBall] = useState(null);
  const [currentShot, setCurrentShot] = useState(null);

  const target = 70;

  let shotTimeout = '50%';

  useEffect(() => {
    async function fetchData() {
      nextBall(5000);
    }
    fetchData();
  }, []);

  async function getData() {
    //Will fetch the types of balls and shots
  }

  async function ballTimer() {
  
  }

  function handleShotSelect(shot) {
    // alert(shot);
    debugger
    // console.log(shot, currentBall);
    let run = Math.floor(Math.random() * 7);
    console.log(run, '--------------');

    let currentRuns = score.runs + run;
    let wickets = run === 0 ? score.wicket + 1 : score.wicket;

    setOver(() => {
      if(over.length == 6) return [run];
      return [...over, run];
    });

    
    let overNuber = (score.ballNumber == 5) ? score.over + 1 : score.over;
    let ballNumber = (score.ballNumber == 5) ? 0 : score.ballNumber + 1;
    setScore({
       runs: currentRuns, 
      wicket: wickets, 
      over: overNuber,
      ballNumber: ballNumber,
    });
    

    nextBall(3000);
    setCurrentBall(null);


    //stop the shotselecttimer
    //update the score
    //move to next ball
  }

  // const [showNextBall, setShowNextBall] = useState(false);
  //
  const [timer, setTimer] = useState(4);

  function nextBall(time) {
    
    const ball = Math.floor(Math.random() * 6)
    console.log(ball);
    let typeofBall = typesOfBalls[ball];

    setTimeout(() => {
      setCurrentBall(typeofBall);
    },time);
    
    for(let i = 1; i <= 3; i++) {
      var countDown = 3;
      setTimeout(() => {
        setTimer(countDown--);
      },i*1000);
    }
    //Start the next ball in .. seconds timer
    //When timer finished shows the ball
  }

  return (
    <div>
      <Header />
      <div className="game-controlls-container">
        <div className="bowling-container">
          {Boolean(currentBall) && <div>{currentBall}</div>}

          {!Boolean(currentBall) && <div>Next Ball in {timer} Seconds</div>}
        </div>
        <div className="batting-container">
        <div className="shots-container">
          {typesOfShots.map((shot, index) => (
            <>
              {/* <button className="p-2 lg:w-1/3 md:w-1/2 w-full"> */}
                <div 
                key={index}
                  className="h-full flex items-center  border-gray-200 border p-4 rounded-lg"
                  onClick={() => handleShotSelect(shot)}
                >
                  <img
                    alt="team"
                    className="w-16 h-16 bg-gray-100 object-cover object-center flex-shrink-0 rounded-full mr-4"
                    src="https://dummyimage.com/80x80"
                  />
                  <div className="flex-grow">
                    <h2 className="text-white title-font font-medium">{shot}</h2>
                  </div>
                </div>
              {/* </button> */}
            </>
          ))}
          </div>
          {/* <div Name="shotTimeout-loader-container" style={{backgroundColor:'red', height:'10px', width:''}}> */}
          {
            //Width reducer function - start when ball displays
            //if timeout then add 0 to score and move to next ball
            //Stop when timeout or shot is selected
          }
          {/* </div> */}
        </div>
      </div>
      <Scorecard score={score} over={over} target={target} />
    </div>
  );
};

export default Home;
