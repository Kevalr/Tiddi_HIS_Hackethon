import React from "react";

const Scorecard = ({ score, over, target }) => {
  return (
    <div>
      <div className="bg-gray-900 container px-20 -mr-20 mb-0 border-white border-t-gray-50 border-t ">
        <div className="flex flex-wrap  text-center">
          <div className="p-4 sm:w-1/6 w-1/6 border-white border-r-2 items-center">
            <h2 className="title-font font-medium sm:text-4xl text-3xl text-white text-center">
              {score.runs} - {score.wicket}
            </h2>
            {/* <p className="leading-relaxed text-white">Score</p> */}
          </div>
          <div className="p-4 sm:w-1/6 w-1/6 border-r-2">
            <h2 className="title-font font-medium sm:text-4xl text-3xl text-white text-center ">
              {score.over}.{score.ballNumber}
            </h2>
            {/* <p className="leading-relaxed text-white">Overs</p> */}
          </div>
          <div className="p-4 sm:w-1/2 w-1/2  border-white border-r-2 ">
            <div className="flex space-x-4 ml-36">
              {over.map((ball, index) => {
                return (
                  <p
                    key={index}
                    className="title-font font-medium sm:text-1xl text-1xl text-black relative w-1 h-1 bg-white rounded-full flex justify-center items-center text-center p-5 shadow-xl "
                  >
                    {ball}
                  </p>
                );
              })}
            </div>
            {/* <p className="leading-relaxed text-white text-center  border-white ">
              Balls
            </p> */}
          </div>
          <div className="p-4 sm:w-1/6 w-1/6">
            <h2 className="title-font font-medium sm:text-4xl text-3xl text-white text-center ">
              Target : {target}
            </h2>
            {/* <p className="leading-relaxed text-white">Target</p>  */}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Scorecard;
