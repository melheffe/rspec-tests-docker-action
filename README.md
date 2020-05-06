# rspec-tests docker action

This action runs rspec test for specified path inside test suite.

## Inputs

### `tests-to-run`

**Nor required** The path in test suite to run. Default `"./spec"`.

## Example usage

uses: actions/rspec-tests-docker-action@v1
with:
  tests-to-run: './spec/features'
