# Non-Linear Equations and Interpolation

This repository contains MATLAB functions for solving non-linear equations and performing interpolation. The toolbox includes implementations of the bisection method, Newton interpolation, and drawing B-Splines for a given interval.

- Tests are available within the source codes
  
## Functions

### 1. Bisection Method (`bisect.m`)
Find the root of a function using the bisection method.

#### Input Arguments:
- Function `f` (as a string)
- Starting interval ends `(a, b)`
- Number of steps `n`

#### Output Arguments:
- Approximation of the root `x`
- Error estimation `ε`

Before starting, the interval is checked to ensure the existence of a root.

### 2. Newton Interpolation (`newtonip.m`)
Perform Newton interpolation to find the coefficients of the interpolation polynomial.

#### Input Parameters:
- Nodes of interpolation
- Function values at the nodes

#### Output Arguments:
- Coefficients of the interpolation polynomial (Newton form)

**Additional Function:** `drawInterpolation`
Evaluate a polynomial in Newton form.

### 3. B-Splines Drawing (`bsplinedraw.m`)
Draw B-Splines for the interval `[0,1]` based on given indices.

#### Input Parameters:
- Indices of B-Spline

#### Output Arguments:
- No output required

The recursion of B-Splines is used for drawing.
