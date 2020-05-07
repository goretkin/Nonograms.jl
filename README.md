# Nonograms

[![Build Status](https://gitlab.com/goretkin/Nonograms.jl/badges/master/build.svg)](https://gitlab.com/goretkin/Nonograms.jl/pipelines)
[![Coverage](https://gitlab.com/goretkin/Nonograms.jl/badges/master/coverage.svg)](https://gitlab.com/goretkin/Nonograms.jl/commits/master)
[![Build Status](https://travis-ci.com/goretkin/Nonograms.jl.svg?branch=master)](https://travis-ci.com/goretkin/Nonograms.jl)
[![Coverage](https://codecov.io/gh/goretkin/Nonograms.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/goretkin/Nonograms.jl)
[![Coverage](https://coveralls.io/repos/github/goretkin/Nonograms.jl/badge.svg?branch=master)](https://coveralls.io/github/goretkin/Nonograms.jl?branch=master)


```
▦ ▦ × ▦ ▦ × × ▦ ▦ ▦ ▦ × × ▦ ▦ ▦ × ▦ × × ▦ ▦ × ▦ ▦
▦ ▦ × ▦ ▦ ▦ × × ▦ ▦ × × ▦ ▦ ▦ ▦ × ▦ × ▦ ▦ ▦ × × ▦
▦ ▦ × ▦ ▦ ▦ ▦ × × × × ▦ ▦ ▦ ▦ ▦ × × × ▦ × × ▦ × ▦
▦ ▦ × ▦ ▦ ▦ ▦ ▦ × × ▦ ▦ ▦ ▦ ▦ × × × ▦ × × × × ▦ ×
▦ ▦ × × ▦ ▦ ▦ ▦ ▦ × ▦ ▦ ▦ ▦ ▦ × × × ▦ × ▦ ▦ × ▦ ×
▦ ▦ ▦ × × × ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ × × × ▦ × × ▦ ▦ × × ▦
▦ ▦ ▦ × × ▦ ▦ × × × × × ▦ × × ▦ × ▦ × ▦ ▦ ▦ ▦ × ▦
× × × × ▦ × × ▦ ▦ ▦ ▦ × × ▦ × ▦ × ▦ × ▦ ▦ ▦ ▦ × ▦
▦ ▦ ▦ ▦ × × × ▦ ▦ × × × × ▦ × ▦ × ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦
▦ ▦ ▦ × × × × × × × × × × ▦ × ▦ × ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦
× ▦ × × × × × × × × × ▦ ▦ × × ▦ × × ▦ ▦ ▦ ▦ ▦ ▦ ×
× × ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ × ▦ ▦ × ▦ ▦ × ▦ ▦ ▦ ▦ ▦ ▦ ×
▦ × × × × × × × ▦ × × × × ▦ × ▦ ▦ × ▦ ▦ ▦ ▦ ▦ × ×
▦ ▦ ▦ ▦ ▦ ▦ × ▦ ▦ × × × × ▦ × ▦ × × ▦ ▦ ▦ ▦ ▦ × ×
▦ ▦ ▦ ▦ ▦ × × ▦ × × × × × ▦ × × × ▦ ▦ ▦ ▦ ▦ ▦ × ▦
▦ × × × × × ▦ × × × × × × × ▦ ▦ × ▦ ▦ ▦ ▦ ▦ × × ▦
× × ▦ ▦ × ▦ × ▦ × × × × × ▦ × ▦ ▦ ▦ ▦ ▦ ▦ ▦ × ▦ ▦
× ▦ × × ▦ ▦ × ▦ × ▦ × ▦ × ▦ × ▦ ▦ ▦ × × ▦ ▦ × ▦ ▦
× ▦ × × × ▦ × ▦ ▦ ▦ × ▦ ▦ ▦ × × ▦ × × × ▦ × × ▦ ▦
× × ▦ ▦ × × × ▦ ▦ ▦ × ▦ ▦ ▦ × × × × × ▦ ▦ × ▦ ▦ ▦
▦ × × ▦ ▦ ▦ × × ▦ ▦ × × ▦ ▦ × × × ▦ ▦ ▦ × × ▦ ▦ ▦
× × × × × ▦ ▦ × ▦ ▦ × × ▦ ▦ × ▦ ▦ ▦ × × × × × ▦ ▦
× ▦ ▦ ▦ ▦ ▦ ▦ × ▦ ▦ × × ▦ ▦ × ▦ ▦ ▦ ▦ ▦ ▦ ▦ × ▦ ▦
× ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ ▦ × ▦ ▦
× × × × × × × ▦ ▦ ▦ × × ▦ ▦ ▦ × × × × × × × × ▦ ▦
```
