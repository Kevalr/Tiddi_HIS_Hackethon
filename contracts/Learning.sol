// pragma solidity >=0.8.4;

// contract learning {
//     // Default methods
//     uint256 coins = 0;

//     function add() public {
//         coins += 1;
//     }

//     function subtract() public {
//         coins -= 1;
//     }

//     function set(uint256 _coins) public {
//         coins = _coins;
//     }

// }

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract learning{

    // enum ChooseField {Tie,BAT,BALL} 
    // ChooseField public chooseField;

    enum TypeOfBaller {Fast,Spin} 
    TypeOfBaller public typeOfBaller;

    enum FasterBallType {yorker,full,good,short,bouncer,fullTose} 
    FasterBallType public fasterBallType;

    enum SppinerBallType {topSpin, Doosra, armBall, offBreak}
    SppinerBallType public sppinerBallType;

    // yorker => Dab,Scoop,Drive,Reverse Sweep,
    enum TypeOfShot {
                    scoop,
                    legGlance,
                    sweep,
                    hook,
                    pull,
                    onDrive,
                    loftedDrive,
                    straightDrive,
                    offDrive,
                    coverDrive,
                    squareDrive,
                    squareCut,
                    duck,
                    reveseSweep,
                    upeerCut
                    }

    TypeOfShot typeOfShot;

    //This is for generating the random number
    uint public randNumber = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender))) % 2;
   

    uint256 public  typeComputerBalling = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender))) % 2;
    
    uint256 public fastComputer = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender))) % 6;

    uint256 public spinComputer = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender))) % 4;
    

    //This is for number of Ball
    modifier numOfBalll()
    {
        for(uint256 noBall = 1;noBall <=2; noBall++){
            _;
        }
    }
    modifier numOfOver(){
        for(uint256 noOver = 1;noOver <= 5;noOver++){
            _;
        }
    }

    uint public run = 0; 

    function computerSideGame(uint256 val) public numOfBalll() numOfOver() returns(uint256) {

        require(val >= 15,"Please select more then 15 number");

        if(typeComputerBalling == 0) {
            if(fastComputer == 0){
                if(((fasterBallType == FasterBallType.yorker) && ( typeOfShot== TypeOfShot.legGlance && val == 2))
                 || ((fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.scoop && val == 1))){
                 run += 4;
            } 
             else if((fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.straightDrive && val == 8) || 
             (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.loftedDrive && val == 7)) {
                 run += 6;
            }
            
            else if((fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.pull && val == 5) ||
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.hook && val == 4) || 
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.upeerCut && val == 15) ||
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.squareCut && val == 12) ||
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.squareDrive && val == 11) ||
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.offDrive && val == 9)){
                        run += 0;
                } 
            
            else if((fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.sweep && val == 3) || 
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.reveseSweep && val == 14) ||
                    (fasterBallType == FasterBallType.yorker) && (typeOfShot == TypeOfShot.duck && val == 13 )) {
                        run += 1;
                    }
            }

        else if(fastComputer == 1){
            if((fasterBallType == FasterBallType.full)){
                if((fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.offDrive && val == 9) || 
                   (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.onDrive  && val == 6) || 
                   (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.squareDrive && val == 11) ||
                   (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.squareCut && val == 12) || 
                   (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.pull && val == 5) ||
                   (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.hook && val == 4)){
                       run += 4;
                   } 
                   else if((fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.hook && val == 4) ||
                           (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) || 
                           (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.straightDrive && val == 8) || 
                           (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.legGlance && val == 2)) {
                               run += 6;
                    }
                    else if((fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.sweep && val == 3) ||
                             (fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.reveseSweep && val == 14) ){
                                 run += 0;
                    } else if((fasterBallType == FasterBallType.full) && (typeOfShot == TypeOfShot.loftedDrive && val == 7)) {
                        run += 1;
                    }
            }
        else if(fastComputer == 2){
            if((fasterBallType == FasterBallType.good)){

                if((fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.pull && val == 5) || 
                  (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.upeerCut && val == 15) ||
                  (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.hook && val == 4) || 
                  (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.squareCut && val == 12)){
                    run += 4;
                } 

                else if((fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.scoop && val == 1) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.legGlance && val == 2) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.sweep && val == 3) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.onDrive && val == 6) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.straightDrive && val == 8) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.offDrive && val == 9) || 
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.squareDrive && val == 11) ||
                        (fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.reveseSweep && val == 14))
                        {
                            run += 0;
                        }
                else if((fasterBallType == FasterBallType.good) && (typeOfShot == TypeOfShot.duck && val == 13)) {
                    run += 1;
                }
        }
        }
        }

        else if(fastComputer == 3){
            if((fasterBallType == FasterBallType.short)) {
                if((fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.duck && val == 13)) {
                    run += 1;
                }
                else if((fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.scoop && val == 1) ||
                   (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.legGlance && val == 2) ||
                   (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.hook && val == 4) || 
                   (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.pull && val == 5) ||
                   (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.squareCut && val == 12) 
                   ) {
                       run += 2;
                } 
                else if((fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.onDrive && val == 6) ||
                        (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) || 
                        (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.straightDrive && val == 8) ||
                        (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.offDrive && val == 9) || 
                        (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.coverDrive && val == 10) || 
                        (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.squareDrive && val == 11) || 
                        (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.reveseSweep && val == 14) || 
                        (fasterBallType == FasterBallType.short) && (typeOfShot == TypeOfShot.upeerCut && val == 15)) {
                            run += 0;
                        }
            }
        }
        else if(fastComputer == 4){
            if((fasterBallType == FasterBallType.bouncer)){
                if((fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.pull && val == 5) ||
                   (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.hook && val == 4) ||
                   (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.scoop && val == 1) ||
                   (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.legGlance && val == 2)
                   ){
                       run+=6;
                   }
                else if((fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.sweep && val == 3) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.onDrive && val == 6) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.straightDrive && val == 8) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.offDrive && val == 9) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.squareDrive && val == 11) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.squareCut && val == 12) ||
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.reveseSweep && val == 14) || 
                           (fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.upeerCut && val == 15)
                           ){
                               run += 0;
                           }

                else if((fasterBallType == FasterBallType.bouncer) && (typeOfShot == TypeOfShot.duck && val == 13)){
                       run += 1;
                   }
            }
        }
        else if(fastComputer == 5){
            if((fasterBallType == FasterBallType.fullTose)){
                if((fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.hook && val == 4) ||
                  (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.legGlance && val == 2)||
                  (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.hook && val == 4) ||
                  (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.pull && val == 5) ||
                  (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.onDrive && val == 6) || 
                  (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.loftedDrive && val == 7)
                  )
                {
                    run += 6;
                }
                
                else if((fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.straightDrive && val == 8) || 
                        (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.offDrive && val == 9) || 
                        (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                        (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.squareDrive && val == 11) 
                        )
                {
                    run += 4;
                }
                
                else if((fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.scoop && val == 1) ||
                       (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.sweep && val == 3) || 
                        (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.squareCut && val == 12) ||
                        (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.reveseSweep && val == 14) ||
                        (fasterBallType == FasterBallType.fullTose) && (typeOfShot == TypeOfShot.upeerCut && val == 15)
                       )
                {
                    run += 0;
                }
            }
        }


        //This is for spin type of an bolwing  
        else if(typeComputerBalling == 1){
            if(spinComputer == 0){
            if(sppinerBallType == SppinerBallType.topSpin) {
             if((sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.sweep && val == 3) ||
                (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) ||
                (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.reveseSweep && val == 14))
              { 
                  run += 6;
              }
             else if((sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.scoop && val == 1) || 
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.legGlance && val == 2) ||
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.hook && val == 4) || 
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.pull && val == 5) || 
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.squareCut && val == 12) || 
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.upeerCut && val == 15)
                    )
              {
                         run += 0;
              }
             else if((sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.onDrive && val == 6) || 
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.straightDrive && val == 8) ||
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.offDrive  && val == 9) ||
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                    (sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.squareDrive && val == 11)
                    )
              {
                  run += 4;
              }
              else if((sppinerBallType == SppinerBallType.topSpin) && (typeOfShot == TypeOfShot.duck && val == 13)){
                  run += 1;
              }
            }
            }
        }

            else if(spinComputer == 1){
                if((sppinerBallType == SppinerBallType.Doosra)){
                if((sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.sweep && val == 3) ||
                     (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.reveseSweep && val == 14))
                  {
                      run += 6;
                  }
                  else if((sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.legGlance && val == 2) ||
                         (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) ||
                         (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.straightDrive && val == 8))
                  {
                      run += 4;
                      }
                  else if((sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.duck && val == 13))
                  {
                      run += 1;
                      }
                  else if((sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.scoop && val == 1) ||
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.hook && val == 4) ||
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.pull && val == 5) ||
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.onDrive && val == 6) ||
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.offDrive && val == 9) ||
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.squareDrive && val == 11) || 
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.squareCut && val == 12) ||
                        (sppinerBallType == SppinerBallType.Doosra) && (typeOfShot == TypeOfShot.upeerCut && val == 15))
                  {
                      run += 0;
                  }
            }
            }

            else if(spinComputer == 2){
                if((sppinerBallType == SppinerBallType.armBall)){
                    if((sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.sweep && val == 3) ||
                        (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) ||
                        (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.reveseSweep && val == 14)){
                          run += 6;
                      } 
                      else if((sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.scoop && val == 1) || 
                             (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.onDrive && val == 6) || 
                             (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.straightDrive && val == 8)) {
                          run += 4;
                      }
                      else if((sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.legGlance  && val == 2) ||
                              (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.offDrive && val == 9) ||
                              (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                              (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.squareDrive && val == 11) ||
                              (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.duck && val == 13)) {
                          run += 1;
                      }
                      else if((sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.hook && val == 4) ||
                              (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.pull && val == 5) || 
                              (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.squareCut && val == 12) ||
                              (sppinerBallType == SppinerBallType.armBall) && (typeOfShot == TypeOfShot.upeerCut && val == 15)
                              ) {
                          run += 0;
                      }
                }
            }
            else if(spinComputer == 3){
                if((sppinerBallType == SppinerBallType.offBreak)){
                    if((sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.sweep && val == 3) ||
                      (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.loftedDrive && val == 7) ||
                      (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.reveseSweep && val == 14)){
                          run += 6;
                      } 
                      else if((sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.straightDrive && val == 8) 
                             ){
                          run += 4;
                      }
                      else if((sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.scoop  && val == 1) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.legGlance  && val == 2) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.onDrive  && val == 6) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.offDrive && val == 9) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.coverDrive && val == 10) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.squareDrive && val == 11) ){
                          run += 1;
                      }
                      else if((sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.hook) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.pull) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.squareCut) ||
                              (sppinerBallType == SppinerBallType.offBreak) && (typeOfShot == TypeOfShot.upeerCut)){
                          run += 0;
                      }
                }
            }
            }
            return run;
        }

    }