-- * Conway’s Game of Life
-- Abdul Akhundzada
-- Student number: 150220926

import Codec.Picture
import System.Directory (createDirectoryIfMissing)
import Utils (matrixToImage)
import Patterns (Pattern(..), blinkerPattern, toadPattern, beaconPattern, pulsarPattern, pentadecathlonPattern)

main :: IO ()
main = do
  let patterns = zip [1..]
        [ blinkerPattern
        , toadPattern
        , beaconPattern
        , pulsarPattern
        , pentadecathlonPattern
        ]
  mapM_
    (\(i, Pattern { patternFunc = patFn, fullCycleIterations = n }) -> do
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
          [0..n]
    )
    patterns