-- * Conway’s Game of Life
-- Abdul Akhundzada
-- Student number: 150220926

import Codec.Picture
import System.Directory (createDirectoryIfMissing)
import Utils (matrixToImage)
import Constants
import Patterns (blinker, toad, beacon, pulsar, pentadecathlon)

main :: IO ()
main = do
  let patternFuncs = zip [1..]
        [ blinker
        , toad
        , beacon
        , pulsar
        , pentadecathlon
        ]
  mapM_
    (\(i, patFn) -> do
        let dirName = "frames" ++ show i
        createDirectoryIfMissing True dirName
        putStrLn $ "Folder Created: " ++ dirName
        mapM_
          (\j -> do
              let matrix = patFn j
              let image = matrixToImage matrix
              let fileName = dirName ++ "/frame" ++ show j ++ ".png"
              savePngImage fileName (ImageRGB8 image)
              putStrLn $ "Saved: " ++ fileName
          )
          [0..nIterations]
    )
    patternFuncs
