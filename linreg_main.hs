import Data.List

{- A type wrapper for the coefficients for our estimation function
i.e. theta0 and theta1 -}
newtype Coefficients =
  Coefficients (Float, Float)
  deriving (Show)

{- A type wrapper for a data point in the training set, 
with the first member being the x value and the second the y value -} 
newtype Example =
  Example (Float, Float)

-- A type wrapper for a training set, which is just a list of examples
newtype TrainingSet =
  TrainingSet [Example]
  

-- Finds coefficients for linear regression using gradient descent
linearRegression :: Coefficients -> Float -> TrainingSet -> Int -> Coefficients
linearRegression coefficients alpha dataset iterations
  | iterations == 0 = coefficients
  | otherwise =
    let thetas = newThetas coefficients alpha dataset
     in linearRegression thetas alpha dataset (iterations - 1)

-- Calculate new values for t0 and t1
newThetas :: Coefficients -> Float -> TrainingSet -> Coefficients
newThetas thetas alpha dataset =
  let deltas = map (calculateDelta thetas) examples
      adjustedDeltas = adjustDeltas deltas examples
      newt0 = t0 - alpha * avg deltas
      newt1 = t1 - alpha * avg adjustedDeltas
   in Coefficients (newt0, newt1)
  where
    Coefficients (t0, t1) = thetas
    TrainingSet examples = dataset

-- Calculates the difference between h(x) and y
calculateDelta :: Coefficients -> Example -> Float
calculateDelta thetas example = t0 + t1 * x - y
  where
    Coefficients (t0, t1) = thetas
    Example (x, y) = example


adjustDeltas :: [Float] -> [Example] -> [Float]
adjustDeltas deltas examples =
  let xs = map (\(Example (x, _)) -> x) examples
      zipped = zip deltas xs
   in map (uncurry (*)) zipped

avg xs = realToFrac (sum xs) / genericLength xs

main :: IO ()
main = do
  let thetas = Coefficients (0, 0)
  let alpha = 0.3 
  let trainingset =
        TrainingSet [Example (0, 50), Example (1, 60), Example (2, 70)]
  let iterations = 500
  print $ show $ linearRegression thetas alpha trainingset iterations
  
  
