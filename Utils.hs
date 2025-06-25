module Utils where

import Codec.Picture
import Constants (cellSize, imageSize, colorFor)

-- ! A dead cell with exactly three living neighbors becomes alive.
-- ! A living cell with two or three living neighbors remains alive; otherwise, it dies.
conwayStep :: [[Int]] -> [[Int]]
conwayStep grid = 
  [ [ nextState x y | x <- [0..w-1] ] | y <- [0..h-1] ]
  where
    h = length grid
    w = length (head grid)
    nextState x y =
      let n = countNeighbors x y
          c = grid !! y !! x
      in case (c, n) of
        (1, 2) -> 1
        (1, 3) -> 1
        (1, _) -> 0
        (0, 3) -> 1
        _      -> 0
    countNeighbors x y =
      length [ () |
        dx <- [-1..1], dy <- [-1..1],
        (dx,dy) /= (0,0),
        let nx = x + dx; ny = y + dy,
        nx >= 0, ny >= 0, nx < w, ny < h,
        (grid !! ny !! nx) == 1
      ]


-- * Takes a small pattern and centers it,
-- * setting all other cells to zero.
embed :: [[Int]] -> Int -> [[Int]]
embed pattern gridSize =
  let ph = length pattern
      pw = length (head pattern)
      oy = (gridSize - ph) `div` 2
      ox = (gridSize - pw) `div` 2
  in [ [ if y >= oy && y < oy + ph && x >= ox && x < ox + pw
         then (pattern !! (y - oy)) !! (x - ox)
         else 0
       | x <- [0..gridSize-1] ]
     | y <- [0..gridSize-1] ]


matrixToImage :: [[Int]] -> Image PixelRGB8
matrixToImage mat = generateImage pixelAt imageSize imageSize
  where
    pixelAt x y =
      let row = y `div` cellSize
          col = x `div` cellSize
          val = (mat !! row) !! col
      in colorFor val