# MCMC

MATLAB experiments in Markov chain Monte Carlo (MCMC) sampling and kernel density estimation (KDE), motivated by Bayesian inference. The project explores proposal scales, acceptance rates, sample distributions, and density-estimation bandwidths.

## Methods and files

| Files | Purpose |
|---|---|
| `mh.m` | One-dimensional random-walk Metropolis–Hastings. |
| `gibbs.m` | Two-dimensional Metropolis-within-Gibbs: coordinatewise Metropolis updates. |
| `hal.m` | Two-dimensional Metropolis-adjusted Langevin sampling. |
| `kde.m`, `kde3.m` | Gaussian KDE in one and two dimensions. |
| `vkde.m` | Variable-bandwidth KDE in one dimension. |
| `showme.m`, `showme3.m` | Compare empirical and target densities. |

## Requirements

MATLAB with Statistics and Machine Learning Toolbox for sampling. `hal.m` additionally requires Symbolic Math Toolbox. Place the files in MATLAB’s current folder or on its search path.

## Example

Sample a standard normal distribution:

```matlab
rng(1);
f = @(x) exp(-0.5 .* x.^2);   % Unnormalized target
p = @(x) f(x) ./ sqrt(2*pi);  % Normalized density for plotting
[acceptance, samples] = mh(f, p, 10000, 0, 1);
```

This returns 5,000 samples after discarding the first half of the chain, reports the second-half acceptance rate, and plots the empirical density against `p`.

## Notes

- Use an even `n`; burn-in and plotting ranges are fixed in the source.
- `gibbs.m` returns the final 1,001 retained states and requires `n >= 2002`; `hal.m` returns the final 501 and requires `n >= 1002`.
- Density functions used for plotting must support array inputs.
- These are exploratory implementations; acceptance rates and density plots alone do not establish convergence.
