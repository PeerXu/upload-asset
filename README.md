# Upload Asset Docker Action

This action upload file to release asset.

## Environments

### `GITHUB_TOKEN`

**Required** set `secrets.GITHUB_TOKEN` to `env.GITHUB_TOKEN`

## Inputs

### `file`

**Required** upload file to release asset

### `suffix`

file suffix

**Default** `.tar.gz`

### `os`

which operating system platform for file to execute

### `arch`

which architecture platform for file to execute

### `with_tag`

upload file to asset with tag version

**Default** `true`

### Example usage

    - uses: PeerXu/upload-asset@v1
      with:
        file: path/to/binary.tar.gz
        os: linux
        arch: amd64
        with_tag: true
        suffix: .tar.gz
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
