module Patterns where

import Utils (conwayStep, embed)
import Constants (gridSize)

-- ! Pattern 'seeds'.
-- `embed` will center them in the grid.
blinkerOrig :: [[Int]]
blinkerOrig = [[0,0,0],[1,1,1],[0,0,0]]

toadOrig :: [[Int]]
toadOrig = [[0,1,1,1],[1,1,1,0]]

beaconOrig :: [[Int]]
beaconOrig = [[1,1,0,0],[1,1,0,0],[0,0,1,1],[0,0,1,1]]

pulsarOrig :: [[Int]]
pulsarOrig = 
  [ [0,0,1,1,1,0,0,0,0,1,1,1,0,0]
  , [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  , [1,0,0,0,0,1,0,0,0,1,0,0,0,0]
  , [1,0,0,0,0,1,0,0,0,1,0,0,0,0]
  , [1,0,0,0,0,1,0,0,0,1,0,0,0,0]
  , [0,0,1,1,1,0,0,0,0,1,1,1,0,0]
  , [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  , [0,0,1,1,1,0,0,0,0,1,1,1,0,0]
  , [1,0,0,0,0,1,0,0,0,1,0,0,0,0]
  , [1,0,0,0,0,1,0,0,0,1,0,0,0,0]
  , [1,0,0,0,0,1,0,0,0,1,0,0,0,0]
  , [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  , [0,0,1,1,1,0,0,0,0,1,1,1,0,0]
  ]

pentadecathlonOrig :: [[Int]]
pentadecathlonOrig = 
  [ [0,0,0,0,0,0,0,0,0,0,0]
  , [0,0,0,0,0,1,0,0,0,0,0]
  , [0,0,0,0,1,0,1,0,0,0,0]
  , [0,0,0,0,1,0,1,0,0,0,0]
  , [0,0,0,0,0,1,0,0,0,0,0]
  , [0,0,0,0,0,1,0,0,0,0,0]
  , [0,0,0,0,1,0,1,0,0,0,0]
  , [0,0,0,0,1,0,1,0,0,0,0]
  , [0,0,0,0,0,1,0,0,0,0,0]
  , [0,0,0,0,0,0,0,0,0,0,0]
  ]

-- ! Patterns.
blinker :: Int -> [[Int]]
blinker j = iterate conwayStep (embed blinkerOrig gridSize) !! j

toad :: Int -> [[Int]]
toad j = iterate conwayStep (embed toadOrig gridSize) !! j

beacon :: Int -> [[Int]]
beacon j = iterate conwayStep (embed beaconOrig gridSize) !! j

pulsar :: Int -> [[Int]]
pulsar j = iterate conwayStep (embed pulsarOrig gridSize) !! j

pentadecathlon :: Int -> [[Int]]
pentadecathlon j = iterate conwayStep (embed pentadecathlonOrig gridSize) !! j