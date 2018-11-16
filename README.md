# strelka2-variant-calling-pipeline

## Usage

1. Clone the repo.

```
git clone --recurse-submodules https://github.com/dohlee/strelka2-variant-calling-pipeline.git
```

2. Modify Snakefiles of submodules to use `config.yaml` in the top directory.

3. Configure `config.yaml`.

4. Implement `is_paired` function in `wxs-preprocessing-pipeline/rules/bwa.smk`.
