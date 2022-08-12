# CompileMemUsageReproducer

This repo demonstrates excessive swift compiler memory usage when compiling array large array literals on linux.
This memory usage is exacerbated as the contained objects become more complex.

It contains three targets:
- `LargeIntArray`: A 1000-element integer array literal
- `LargeObjectArray`: A 1000-element struct array literal. The struct has a single immutable integer property. 
- `LargeExistentialArray`: A 1000-element existential array literal. This contains a protocol with a single integer property
and a simple conforming struct. 

## Workflow

This workflow uses a docker image to isolate memory usage and make the analysis cross-platform. These results have been observed
on native (non-docker) linux environments.

In a terminal:

```bash
docker stats
```

In a separate terminal:

```bash
docker build . -t compile_time_reproducer
docker run -it compile_time_reproducer:latest bash

rm -R .build/ && swift build --target LargeIntArray            # Watch container memory usage in other terminal
rm -R .build/ && swift build --target LargeObjectArray         # Watch container memory usage in other terminal
rm -R .build/ && swift build --target LargeExistentialArray    # Watch container memory usage in other terminal
```

## Results:

Memory usage (max observed from multiple iterations):
- LargeIntArray: 63MB
- LargeObjectArray: 500MB
- LargeExistentialArray: 2.0GB
