# Conway’s Game of Life Oscillators

This project is a part of the **Functional Programming (BLG 458E)** course at **Istanbul Technical University**, prepared under the supervision of **Dr. Yusuf H. Şahin**.

## Project Description

The goal of this project is to explore the behavior of **oscillators** in **Conway’s Game of Life**, a classic example of a cellular automaton. Oscillators are finite patterns that return to their original state after a fixed number of generations.

Using **Haskell**, this project implements five different oscillator patterns, based on the paper:

> Brown et al., *Conway’s Game of Life is Omniperiodic*  
> [arXiv:2312.02799](https://arxiv.org/abs/2312.02799)

## Dependencies

1. JuicyPixels
```bash
cabal install JuicyPixels
```

## ▶️ How to Run

Assuming you have [GHC](https://www.haskell.org/ghc/) installed:

```bash
cabal build
cabal run
```