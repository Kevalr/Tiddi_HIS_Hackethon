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
  const typesOfBalls = [
    "yorker",
    "bouncer",
    "length ball",
    "full toss",
    "swinging ball",
    "slower ball",
    "off cutter",
    "leg cutter",
  ];

  const typesOfShots = [
    {
      id: 0,
      name: 'Scoop',
      path: 'https://media.tenor.com/BKDyOABi52IAAAAC/scoop-special-maxi-latest.gif',
    },
    {
      id: 1,
      name: 'Leg Glance',
      path: 'http://newsimg.bbc.co.uk/media/images/41958000/gif/_41958468_bf_leg_glance_416x300.gif',
    }, {
      id: 2,
      name: 'Sweep',
      path: 'https://media.tenor.com/QlqQ4xjCKIwAAAAC/bhibatsam-sachin-tendulkar.gif',
    }, {
      id: 3,
      name: 'Hook',
      path: 'http://newsimg.bbc.co.uk/media/images/41989000/gif/_41989104_hook_side_416x300.gif',
    }, {
      id: 4,
      name: 'Pull',
      path: 'http://newsimg.bbc.co.uk/media/images/41967000/gif/_41967722_pull_shot_416x300.gif',
    }, {
      id: 5,
      name: 'On Drive',
      path: 'https://i.gifer.com/LkvQ.gif',
    }, {
      id: 6,
      name: 'Lofted Drive',
      path: 'https://media.tenor.com/yI3zjVzQEWMAAAAC/bhibatsam-virat-kohli.gif',
    }, {
      id: 7,
      name: 'Straight Drive',
      path: 'https://media.tenor.com/yloRwkD4TrEAAAAC/cricket-straight.gif',
    }, {
      id: 8,
      name: 'Off Drive',
      path: 'https://media.tenor.com/yloRwkD4TrEAAAAC/cricket-straight.gif',
    }, {
      id: 9,
      name: 'Cover Drive',
      path: 'https://media.tenor.com/1aGsSQcy3hMAAAAd/virat-kohli-cover-drive.gif',
    }, {
      id: 10,
      name: 'Square Drive',
      path: 'https://media.tenor.com/EbZthKo2oLwAAAAd/sachin-cut-sachin-square-drive.gif',
    }, {
      id: 11,
      name: 'Square Cut',
      path: 'http://newsimg.bbc.co.uk/media/images/41966000/gif/_41966664_sqr_cut_side_416x300.gif',
    }, {
      id: 12,
      name: 'Duck',
      path: 'https://i.gifer.com/E1Rx.gif',
    }, {
      id: 13,
      name: 'Reverse Sweep',
      path: 'https://media.tenor.com/I9rdu_0IRkUAAAAd/rishabh-pant-james-anderson.gif',
    }, {
      id: 14,
      name: 'Upper Cut',
      path: 'https://media.tenor.com/_UfhWt1zqlcAAAAd/sachin-sachin-tendulkar.gif',
    }
  ];

  const [currentBall, setCurrentBall] = useState(null);
  const [currentShot, setCurrentShot] = useState(null);

  const target = 114;

  useEffect(() => {
    async function fetchData() {
      nextBall(5000);
    }
    fetchData();
  }, []);

  function nextBall(time) {
    //resetting the current shot
    setCurrentShot(null);

    //selecting type of ball to throw
    const ball = Math.floor(Math.random() * 7);
    let typeofBall = typesOfBalls[ball];

    //countdown before ball is thrown
    let countDown = (time / 1000);
    let interval = setInterval(() => {
      setTimer(countDown);
      countDown--;
    }, 1000);

    setTimeout(() => {
      clearInterval(interval);
      setCurrentBall(typeofBall);
      setTimer(null);
    }, time);
  }

  function handleShotSelect(shot) {
    setCurrentShot(shot);
    let run = Math.floor(Math.random() * 7);

    //if run is 5 then replacing it with 1 or 2
    run = run === 5 ? Math.ceil(Math.random() * 2) : run;
    console.log(run, "--------------");

    let currentRuns = score.runs + run;
    let wickets = run === 0 ? score.wicket + 1 : score.wicket;

    setOver(() => {
      if (over.length == 6) return [run];
      return [...over, run];
    });

    let overNuber = score.ballNumber == 5 ? score.over + 1 : score.over;
    let ballNumber = score.ballNumber == 5 ? 0 : score.ballNumber + 1;

    setScore({
      runs: currentRuns,
      wicket: wickets,
      over: overNuber,
      ballNumber: ballNumber,
    });

    nextBall(3000);
    setCurrentBall(null);
  }
  const [timer, setTimer] = useState(null);

  return (
    // <div className="bg-gray-900 body-font min-h-screen flex flex-col">
    //   <Header />
    //   <div className="container mx-auto items-center flex px-5 md:flex-row flex-col pb-5 ">
    //     <div className="lg:max-w-lg lg:w-full md:w-1/2 w-5/6 md:mb-0 mb-10">
    //       <div className="bowling-container text-white">
    //         {Boolean(currentBall) && <div>{currentBall}</div>}
    //         {!Boolean(currentBall) && timer && (
    //           <div>Next Ball in {timer} Seconds</div>
    //         )}
    //       </div>
    //     </div>

    //     <div className="game-controlls-container">
    //       <div className="container px-5 mx-auto">
    //         <div className="flex flex-wrap -m-2">
    //           {typesOfShots.map((shot, index) => {
    //             return (
    //               <button
    //                 className="p-2 lg:w-1/3 md:w-1/2 w-full   "
    //                 key={index}
    //                 disabled={!currentBall}
    //                 onClick={() => handleShotSelect(shot)}
    //               >
    //                 <div className="h-full flex items-center  border-gray-200 border p-4 rounded-lg text-black transition duration-300 ease-in-out hover:scale-105 bg-white hover:bg-gray-900 hover:text-white">
    //                   <img
    //                     alt="team"
    //                     className="w-16 h-16 bg-gray-100 object-cover object-center flex-shrink-0 rounded-full mr-4 "
    //                     src="https://thumbs.dreamstime.com/z/cricket-bat-ball-26570619.jpg"
    //                     height="80px"
    //                     width="80px"
    //                   />
    //                   <div className="flex-grow ">
    //                     <h2 className=" title-font font-medium  ">{shot}</h2>
    //                   </div>
    //                 </div>
    //               </button>
    //             );
    //           })}
    //         </div>
    //       </div>
    //       {showShotSelectLoader && <div className="loader"></div>}
    //     </div>
    //   </div>

    //   <Scorecard score={score} over={over} target={target} />
    // </div>
    <>
      <div className="bg-gray-900 body-font min-h-screen flex flex-col ">
        <Header />
        <div className="container mx-auto items-center flex px-5 md:flex-row flex-col pb-10
        ">
          <div class="p-2 lg:w-1/3 md:w-1/2 w-full h-[33rem]  ">
            <div class="h-full flex items-center  border-gray-200 border p-4 rounded-lg bg-white bg-gradient-to-r from-blue-600 to-white-600">
              <div class="flex-grow  w-52 text-center items-center">
                <h1 class=" title-font font-medium items-center text-5xl  w-60 ml-10 text-black ">
                  {Boolean(currentBall) && <div>{currentBall.toUpperCase()}</div>}
                  {Boolean(timer) && (
                    <div>Next Ball in {timer} Seconds</div>
                  )}
                </h1>
              </div>
            </div>
          </div>

          <div className="container px-5 mx-auto">
            <div className="flex flex-wrap -m-1">
              {typesOfShots.map((shot, index) => {
                return (
                  <button
                    className="p-2 lg:w-1/3 md:w-1/2 w-full"
                    key={shot.id}
                    disabled={!currentBall}
                    onClick={() => handleShotSelect(shot.id)}
                  >
                    <div className="h-full flex items-center  border-gray-200 border p-4 rounded-lg text-black transition duration-300 ease-in-out hover:scale-105 bg-white hover:bg-gray-900 hover:text-white">
                      <img
                        alt="team"
                        className="w-16 h-16 bg-gray-100 object-cover object-center flex-shrink-0 rounded-full mr-4 "
                        src={shot.path}
                        height="80px"
                        width="80px"
                      />
                      <div className="flex-grow ">
                        <h2 className=" title-font font-medium text-grey font-bold">{shot.name.toUpperCase()}</h2>
                      </div>
                    </div>
                  </button>
                );
              })}
            </div>
          </div>
        </div>
        <Scorecard score={score} over={over} target={target} />
      </div>
    </>
  );
};

export default Home;

/** 
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
            </>
          ))}
          </div>
          
          {
            //Width reducer function - start when ball displays
            //if timeout then add 0 to score and move to next ball
            //Stop when timeout or shot is selected
          }
        </div>
      </div>
      <Scorecard score={score} over={over} target={target} />
    </div>
  );
};

export default Home;
*/
