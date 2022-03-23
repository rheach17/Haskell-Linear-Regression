# Haskell-Linear-Regression

Linear Regression tries to model the relationship between continuous values (i.e. numbers) by assuming that one is a linear function of the other (i.e. they have the relationship <b>y=θ0+θ1x</b>). We can then find values for θ0 and θ1 that model what we observe in our training data well. We will do this using gradient descent. Later, we will see how gradient descent has some nice properties that let us generalise our implementation to functions of more than one variable or which are not purely linear in nature.<br>

Before we can use Linear Regression to model data, we need a reliable way to work out what θ0 and θ1 actually are. Gradient descent depends on two simple observations:<br>

Functions (or at least, continuous differentiable functions, which are enough to be getting on with) have minima at points where all the partial derivatives are zero. For the simple case of y=mx+c, that means we have dydx=0. For more complex functions of the form f(x,y), we require that ddx=ddy=0, and so on.<br>
If we go in the direction of negative gradients, we will eventually reach a minimum, assuming one exists (for us not to do so, the function would need to be non-continuous or of unbounded domain, which we will explain away by placing safely out of scope).
