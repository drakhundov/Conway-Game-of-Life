module Patterns where

import Utils (conwayStep, embed)
import Constants (gridSize)

data Pattern = Pattern
  { patternFunc :: Int -> [[Int]]  -- The pattern function
  , fullCycleIterations :: Int    -- Number of iterations for a full cycle
  }

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
blinkerPattern :: Pattern
blinkerPattern = Pattern
  { patternFunc = \iterno -> iterate conwayStep (embed blinkerOrig gridSize) !! iterno
  , fullCycleIterations = 2
  }

toadPattern :: Pattern
toadPattern = Pattern
  { patternFunc = \iterno -> iterate conwayStep (embed toadOrig gridSize) !! iterno
  , fullCycleIterations = 2
  }

beaconPattern :: Pattern
beaconPattern = Pattern
  { patternFunc = \iterno -> iterate conwayStep (embed beaconOrig gridSize) !! iterno
  , fullCycleIterations = 2
  }

pulsarPattern :: Pattern
pulsarPattern = Pattern
  { patternFunc = \iterno -> iterate conwayStep (embed pulsarOrig gridSize) !! iterno
  , fullCycleIterations = 3
  }

pentadecathlonPattern :: Pattern
pentadecathlonPattern = Pattern
  { patternFunc = \iterno -> iterate conwayStep (embed pentadecathlonOrig gridSize) !! iterno
  , fullCycleIterations = 15
  }