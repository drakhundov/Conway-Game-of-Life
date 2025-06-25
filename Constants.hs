module Constants where
    
import Codec.Picture

gridSize :: Int
gridSize = 50

-- Used to construct the image.
-- # of pixels dedicated to each cell.
cellSize :: Int
cellSize = 10

imageSize :: Int
imageSize = gridSize * cellSize

colorFor :: Int -> PixelRGB8
colorFor 0 = PixelRGB8 255 255 255  -- white
colorFor 1 = PixelRGB8 0 0 255      -- blue
colorFor _ = PixelRGB8 0 0 0        -- error!